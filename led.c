#include <pic.h>       //调用头文件，可以去PICC软件下去查找PIC16F88X单片机的头文件
__CONFIG(0x23a2);
__CONFIG(0x3fff);//程序写保护关闭；掉电复位电压设为4v    //定义配置字，晶振类型：XT，关闭开门狗，禁止低电压编程，禁止欠压复位
//RC2 红灯输入；RC3 黄灯输入；RC4 绿灯输入
//RB0 红显示数据出；RB1 无用设为输出；RB2 绿显示数据出；RB3 时钟输出；RB5 锁存信号；RB4黄灯开关
//RB6 板上的指示灯
//RB4=1时开黄灯
//se edita el codigo
//红显示U1(5，7，9，11, 13，15，17)   U2(5，7，9，11, 13，15，17) （U1红个位U2红十位）
//绿显示U3(5，6)(7，8)(9, 10)(11，12)(13，14)(15，16)(17，18)   U4(5，6)(7，8)(9, 10)(11，12)(13，14)(15，16)(17，18)
//1(0x0500),2(0x1451),3(0x1541),4(0x0505),5(0x1145),6(0x1155),7(0x1500),8(0x1555),9(0x1545),0(0x1554);关(0x0000)红显示驱动字
//1(0x0f00),2(0x3cf3),3(0x3fc3),4(0x0f0f),5(0x33cf),6(0x3ff3),7(0x3f00),8(0x3fff),9(0x3fcf),0(0x3ffc);关(0x0000)绿显示驱动字
//////////////////////
//硬件修改说明：去掉电容C9，C10，C11;电容C35，C36，37换成22nF/50;去掉电容C41，C42，C43;其它元件不变
//出现同亮都不显示;出现断路显示正常的,断路的不显示
//*******可以修改的参数********************************************************
#define STUDY_MODE 1           //0表示单周期  1表示双周期
#define PULSE_MIN 80           //交流脉冲宽度最小值(不要小于80)
#define PULSE_MAX 350          //交流脉冲宽度最大值
#define G_SEGMENT_WINK_FLAG  0 //1表示G字段在学习时闪烁，0表示G字段在学习时不闪烁.
#define DISPLAY_SYN_WINK     1 //1表示倒计时和灯同步闪烁，0表示不闪烁。
//*****************************************************************************
#define LAMP_STATE		((PORTC>>2)&0x07)

#define FILTER_ON_TIME  2
#define FILTER_OFF_TIME 21
#define PULSE_SAMPLE_MIN (PULSE_MIN-34)//最大有30
#define PULSE_SAMPLE_MAX (PULSE_MAX+5)
#define DEVIATION_TIME 140 //重新学习时间1.4秒
#define WDTENABLE PSA = 0;WDTCON = 0X15;
#define AHEAD_END_TIME 2

#define RX_LENGTH 30
#define BAUD_RATE_9600 SPBRGH=0X00;SPBRG=0X77;//119
#define LOST_DELAY_TIME 3  //在每秒发送当前显示时间时如果3秒没有收到下一个包则关灯
#define EEPRADDR 0x10//存储地址的位置0X00-0XFF
//	RC5=0发送；RC5=1接收
#define TABLEHEAD 0xfe

//////////////////////
unsigned char TFG;
unsigned char lamp_stab_state;
unsigned char lamp_temp_state;
unsigned char lamp_chge_counter[3];//20MS滤波计数器
unsigned char no_lamp_on_counter;
unsigned char lamp_counter_valid_flag;//计数有效标志

unsigned char lamp_on_flag;
unsigned int lamp_on_counter[3];
unsigned char lamp_off_flag;
unsigned int lamp_off_counter[3];
unsigned char lamp_off_time[3];//记录下每次的脉冲宽度,在刚开始显示的那一秒中减出去
unsigned char g_segment_wink_time_counter;
unsigned char g_segment_wink_state_flag;
unsigned char g_segment_wink_display_flag;
unsigned char g_segment_100ms_counter;
unsigned char g_segment_afresh_state;
unsigned char g_segment_afresh_counter;
unsigned char g_segment_afresh_number;
unsigned char syn_wink_display_state;//同步闪烁
unsigned char syn_wink_display_updata;//为1表示有显示数据更新。

bank1 unsigned char ten_mm_counter;
bank1 unsigned char ledstate;
bank1 unsigned char wdtcounter;
bank1 unsigned int previous_study_counter[3];
bank1 unsigned int current_study_counter[3];
bank1 unsigned char study_lamp_stab_state;
bank1 unsigned char study_chge_counter[3];
bank1 unsigned char study_time_flag;
bank1 unsigned char study_time_valid_flag;
bank1 unsigned int display_data[3];

bank1 unsigned char study_to_pulse_flag;
bank1 unsigned char sametime_on_counter;
bank1 unsigned char communication_flag;//1表示通讯模式
bank1 unsigned char communication_counter;

bank1 unsigned char red_displaying_flag;
bank1 unsigned char gre_displaying_flag;
bank1 unsigned char yel_displaying_flag;
bank1 unsigned char displaying_second_counter;

bank1 unsigned char restart_flag;//重启动的第一个红灯时间是不对的(国标) 第二个红灯有效

bank2 unsigned char usart_rx_buffer[RX_LENGTH];
bank2 unsigned char usart_rx_write;
bank2 unsigned char usart_rx_read;
//bank2 unsigned char usart_tx_buffer[TX_LENGTH];
//bank2 unsigned char usart_tx_write;
//bank2 unsigned char usart_tx_read;
bank2 unsigned char usart_temp_buffer[7];
bank2 unsigned char address_of_lamp;
bank2 unsigned char every_second_update_flag;//
bank2 unsigned char every_second_update_counter;
bank2 unsigned char every_second_update_delay;

bank2 unsigned char pulse_study_time_flag;
bank2 unsigned int pulse_study_time_counter[3];
bank2 unsigned char pulse_down_time_valid_flag;
bank2 unsigned int pulse_down_times[3];
//bank2 unsigned char pulse_10mm_counter;

//{0x1554,0x0500,0x1451,0x1541,0x0505,0x1145,0x1155,0x1500,0x1555,0x1545,0x0000,0x0001};
//const unsigned int REDWORDS[12]={0x2aa8,0x0a00,0x28a2,0x2a82,0x0a0a,0x228a,0x22aa,0x2a00,0x2aaa,0x2a8a,0x0000,0x0002};
//const unsigned int GREWORDS[12]={0x3ffc,0x0f00,0x3cf3,0x3fc3,0x0f0f,0x33cf,0x33ff,0x3f00,0x3fff,0x3fcf,0x0000,0x0003};
//const unsigned int YELWORDS[12]={0x2aa8,0x0a00,0x28a2,0x2a82,0x0a0a,0x228a,0x22aa,0x2a00,0x2aaa,0x2a8a,0x0000,0x0001};
const unsigned int REDWORDS[12]={0x3ffc,0x0f00,0x3cf3,0x3fc3,0x0f0f,0x33cf,0x33ff,0x3f00,0x3fff,0x3fcf,0x0000,0x0003};
const unsigned int GREWORDS[12]={0x3ffc,0x0f00,0x3cf3,0x3fc3,0x0f0f,0x33cf,0x33ff,0x3f00,0x3fff,0x3fcf,0x0000,0x0003};
const unsigned int YELWORDS[12]={0x3ffc,0x0f00,0x3cf3,0x3fc3,0x0f0f,0x33cf,0x33ff,0x3f00,0x3fff,0x3fcf,0x0000,0x0003};


void change_DM13H(void)
{
	//RB0 绿显示数据出；RB3 时钟输出；RB5 锁存信号
	unsigned char i,ss,k,temp;
	//four triggering clock pulses (CLK) with high level latch (LAT )
	//DM13H will change to command data input mode (CD mode) at falling edge of the latch pulse (LAT )
	RB5 = 1;//LAT = 1
	for(k=0;k<2;k++);
	RB3 = 0;
	for(k=0;k<2;k++);
	RB3 = 1;
	for(k=0;k<2;k++);
	RB3 = 0;
	for(k=0;k<2;k++);
	RB3 = 1;
	for(k=0;k<2;k++);
	RB3 = 0;
	for(k=0;k<2;k++);
	RB3 = 1;
	for(k=0;k<2;k++);
	RB3 = 0;
	for(k=0;k<2;k++);
	RB3 = 1;
	for(k=0;k<2;k++);
	RB3 = 0;
	for(k=0;k<2;k++);
	RB5 = 0;//LAT = 0
	for(k=0;k<2;k++);

	ss = 0B1000000;
	temp = 0x40;
	for(i=0; i<=6;i++)
	{
		if(ss & temp)
		{
			//RB0 = 1;RB1 = 1;RB2 = 1;
			PORTB |= 0x07;
		}
		else
		{
			//RB0 = 0;RB1 = 0;RB2 = 0;
			PORTB &= 0xf8;
		}

		for(k=0;k<2;k++);
		RB3=1;
		for(k=0;k<6;k++);
		RB3=0;
		temp >>= 1;
	}
	//RB0 = 1;RB1 = 1;RB2 = 1;//SV
	PORTB |= 0x07;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;
	for(k=0;k<2;k++);
	//RB0 = 0;RB1 = 0;RB2 = 0;//NU
	PORTB &= 0xf8;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;
	//RB0 = 0;RB1 = 0;RB2 = 0;//SLP
	PORTB &= 0xf8;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;


	ss = 0B1000000;
	temp = 0x40;
	for(i=0; i<=6;i++)
	{
		if(ss & temp)
		{
			//RB0 = 1;RB1 = 1;RB2 = 1;
			PORTB |= 0x07;
		}
		else
		{
			//RB0 = 0;RB1 = 0;RB2 = 0;
			PORTB &= 0xf8;
		}

		for(k=0;k<2;k++);
		RB3=1;
		for(k=0;k<6;k++);
		RB3=0;
		temp >>= 1;
	}
	//RB0 = 1;RB1 = 1;RB2 = 1;//SV
	PORTB |= 0x07;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;
	for(k=0;k<2;k++);
	//RB0 = 0;RB1 = 0;RB2 = 0;//NU
	PORTB &= 0xf8;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;
	//RB0 = 0;RB1 = 0;RB2 = 0;//SLP
	PORTB &= 0xf8;
	for(k=0;k<2;k++);
	RB3=1;
	for(k=0;k<2;k++);
	RB3=0;


	for(k=0;k<2;k++);
	RB5 = 1;//LAT = 1
	for(k=0;k<2;k++);
	RB5 = 0;//LAT = 0
}

void ioinit(void)
{
	unsigned char i;
	OSCCON=0X08;    		//系统时钟由CONFIG决定	
	ANSEL=0X00;  			//所有IO为数字IO
  	ANSELH=0X00;  			//所有IO为数字IO
	nRBPU = 1;//RB上拉禁止
	PORTB=0B00000000;       //灭掉LED_a-LED_dp 
  	TRISB=0B00000000;   	    //RD设置为输出
	TRISC=0B00011100;       //RC2,RC3,RC4设置为输入

	TFG = 0;
	wdtcounter = 0;
	ledstate = 0;
	
	lamp_stab_state = 0x07;
	lamp_on_flag = 0;
	lamp_off_flag = 0;
	pulse_study_time_flag = 0;
	pulse_down_time_valid_flag = 0;
//	pulse_10mm_counter = 0;
	for(i=0;i<3;i++)
	{
		lamp_chge_counter[i]=0;
		lamp_on_counter[i] = 0;
		lamp_off_counter[i]	= 0;
		previous_study_counter[i] = 0;
		current_study_counter[i] = 0;
		study_chge_counter[i] = 0;
		display_data[i] = 0;
		lamp_off_time[i] = 0;
		pulse_study_time_counter[i] = 0;
		pulse_down_times[i] = 0;
	}
	study_lamp_stab_state = 0x07;
	study_time_flag = 0;
	study_time_valid_flag = 0;

	study_to_pulse_flag = 0;
	sametime_on_counter = 0;

	red_displaying_flag = 0;
	gre_displaying_flag = 0;
	yel_displaying_flag = 0;

	displaying_second_counter = 0;

	ten_mm_counter = 0;
	no_lamp_on_counter = 0;
	lamp_counter_valid_flag = 0;
	restart_flag = 0x55;

	usart_rx_write = 0;
	usart_rx_read = 0;
	communication_flag = 0;//0非通讯模式 1通讯模式
	communication_counter=0;
	address_of_lamp = 0xff;
	
	every_second_update_flag = 0;
	every_second_update_counter = 0;
	every_second_update_delay = 0;
	RC5=1;//485接收模式

          g_segment_wink_time_counter = 0;;
          g_segment_wink_state_flag = 0;
          g_segment_wink_display_flag = 0;
          g_segment_100ms_counter = 0;
	    g_segment_afresh_state = 0;
	    g_segment_afresh_counter = 0;
	    g_segment_afresh_number = 3;

	    syn_wink_display_state = 0;
	    syn_wink_display_updata = 0;

	RB4=0;
	RB5=0;
	RB6=0;
}

unsigned char addr_read(void)
{
	EEADR = EEPRADDR;
	EEPGD = 0;
	RD = 1;
	NOP();
	return EEDATA;	
}

void addr_write(unsigned char indata)
{
	EEADR = EEPRADDR;
	EEDATA = indata;
	EEPGD = 0;
	WREN = 1;
	GIE = 0;
	EECON2 = 0X55;
	EECON2 = 0XAA;
	WR = 1;
	GIE = 1;
	WREN = 0;
	while(WR);		
}

void usartinit(void)
{
	SYNC = 0;
	BRGH = 0;
	BRG16 = 1;
	BAUD_RATE_9600;
	SPEN = 1;//IO口
	CREN = 1;
	TXIE = 0;
	TXEN = 1;
	RX9 = 0;
	TX9 = 0;

	TRISC6=1;
	TRISC7=1;
	PEIE=1;
	GIE=1;
	RCIE = 1;
}

//---------------------------------------
//名称: T1初始化函数		 
//----------------------------------------- 
void timer1init(void)
{
	T1CON=0X21;	//4分频  FOSC/4
	TMR1IF=0;                //清除TMR1中断标志
	TMR1IE=1;                //TMR1中断允许	
	TMR1H=0xFB;             //赋初值，以便TMR1每250US中断一次
	TMR1L=0x85;
	PIR1=0;//清除所有中断标志
	PEIE=1;
	GIE=1;
}

void red_displaydrv(unsigned int drvword)
{
	unsigned int  tempdata;
	unsigned char i;
	unsigned char k;
	tempdata = 0x8000;
	RB1=0;
	RB2=0;
	RB5=0;
	RB3=0;
	//////这个FOR循环一次要216US
	for(i=0;i<16;i++)
	{
		if((drvword & tempdata)==0)	RB0=0;
		else RB0=1;
		for(k=0;k<1;k++);//速度在71K左右
		RB3=1;
		for(k=0;k<5;k++);
		RB3=0;
		tempdata >>= 1;
	}	
}

void yel_displaydrv(unsigned int drvword)
{
	unsigned int  tempdata;
	unsigned char i;
	unsigned char k;
	tempdata = 0x8000;
	RB0=0;
	RB2=0;
	RB5=0;
	RB3=0;
	for(i=0;i<16;i++)
	{
		if((drvword & tempdata)==0)	RB1=0;
		else RB1=1;
		for(k=0;k<1;k++);
		RB3=1;
		for(k=0;k<5;k++);
		RB3=0;
		tempdata >>= 1;
	}	
}

void gre_displaydrv(unsigned int drvword)
{
	unsigned int  tempdata;
	unsigned char i;
	unsigned char k;
	tempdata = 0x8000;
	RB0=0;
	RB1=0;
	RB5=0;
	RB3=0;
	for(i=0;i<16;i++)
	{
		if((drvword & tempdata)==0)	RB2=0;
		else RB2=1;
		for(k=0;k<1;k++);
		RB3=1;
		for(k=0;k<5;k++);
		RB3=0;
		tempdata >>= 1;
	}	
}

void red_displaying(unsigned int number)
{
	unsigned char temp_red_var0;
	unsigned char temp_red_var1;
	unsigned char temp_red_var2;

	if(number > 99) temp_red_var2 = 99;
	else temp_red_var2 = number;

	temp_red_var0 = temp_red_var2/10;
	if(temp_red_var0 == 0) temp_red_var0 = 10;

	temp_red_var1 = temp_red_var2%10;

	red_displaydrv(REDWORDS[temp_red_var0]);
	red_displaydrv(REDWORDS[temp_red_var1]);	
	
	RB5=1;
	for(temp_red_var2=0;temp_red_var2<12;temp_red_var2++);
	RB5=0;
}

void red_displaying_end(void)
{
	unsigned char k;
	red_displaydrv(0x0000);
	red_displaydrv(0x0000);
	RB5=1;
	for(k=0;k<12;k++);
	RB5=0;	
}

void yel_displaying(unsigned int number)
{
	unsigned char temp_yel_var0;
	unsigned char temp_yel_var1;
	unsigned char temp_yel_var2;

	if(number > 99) temp_yel_var2 = 99;
	else temp_yel_var2 = number;

	temp_yel_var0 = temp_yel_var2/10;
	if(temp_yel_var0 == 0) temp_yel_var0 = 10;

	temp_yel_var1 = temp_yel_var2%10;

	yel_displaydrv(YELWORDS[temp_yel_var0]);
	yel_displaydrv(YELWORDS[temp_yel_var1]);
	RB5=1;
	for(temp_yel_var2=0;temp_yel_var2<12;temp_yel_var2++);
	RB5=0;	
}

void yel_displaying_end(void)
{
	unsigned char k;
	yel_displaydrv(0x0000);
	yel_displaydrv(0x0000);
	RB5=1;
	for(k=0;k<12;k++);
	RB5=0;
}

void gre_displaying(unsigned int number)
{
	unsigned char temp_gre_var0;
	unsigned char temp_gre_var1;
	unsigned char temp_gre_var2;

	if(number > 99) temp_gre_var2 = 99;
	else temp_gre_var2 = number;

	temp_gre_var0 = temp_gre_var2/10;
	if(temp_gre_var0 == 0) temp_gre_var0 = 10;

	temp_gre_var1 = temp_gre_var2%10;

	gre_displaydrv(GREWORDS[temp_gre_var0]);
	gre_displaydrv(GREWORDS[temp_gre_var1]);	

	RB5=1;
	for(temp_gre_var2=0;temp_gre_var2<12;temp_gre_var2++);
	RB5=0;
}

void gre_displaying_end(void)
{
	unsigned char k;
	gre_displaydrv(0x0000);
	gre_displaydrv(0x0000);	
	RB5=1;
	for(k=0;k<12;k++);
	RB5=0;
}

void g_segment_displaying(unsigned char number)//			
{
     unsigned char k;
     switch(number)
    {
           case 0:
               	  red_displaydrv(REDWORDS[11]);
	             red_displaydrv(REDWORDS[11]);
	             RB5=1;
	             for(k=0;k<12;k++);
	             RB5=0;
           break;
           case 1:
              	  yel_displaydrv(YELWORDS[11]);
	             yel_displaydrv(YELWORDS[11]);
	             RB5=1;
	             for(k=0;k<12;k++);
	             RB5=0;
          break; 
          case 2:
             	 gre_displaydrv(GREWORDS[11]);
	    	       gre_displaydrv(GREWORDS[11]);
	            RB5=1;
	            for(k=0;k<12;k++);
	            RB5=0;
          break;
          default:
             	gre_displaying_end();
          break;         
      }
}

void syn_wink_manage(unsigned char channel)//最后几秒时是否跟随红绿灯闪烁
{
	unsigned char tempdata;
	
	if(DISPLAY_SYN_WINK == 1)//跟随闪烁
	{
		tempdata = (0x01<<channel);
		if(syn_wink_display_updata == 1)
		{
			syn_wink_display_updata = 0;
			if((lamp_stab_state&tempdata) == 0)
			{
				if(channel == 0) red_displaying(display_data[0]);
				else if(channel == 1) yel_displaying(display_data[1]);
				else gre_displaying(display_data[2]);
				syn_wink_display_state = 1;	
			}
			else
			{
				red_displaying_end();
				syn_wink_display_state = 0;		
			}	
		}

		if(syn_wink_display_state == 1)
		{
			if((lamp_stab_state&tempdata) != 0)
			{
				red_displaying_end();	
				syn_wink_display_state = 0;
			}
		}
		else
		{
			if((lamp_stab_state&tempdata) == 0)
			{
				if(channel == 0) red_displaying(display_data[0]);
				else if(channel == 1) yel_displaying(display_data[1]);
				else gre_displaying(display_data[2]);
				syn_wink_display_state = 1;		
			}	
		}	
	}
	else
     {
		if(syn_wink_display_updata == 1)
		{
			syn_wink_display_updata = 0;
			if(channel == 0) red_displaying(display_data[0]);
			else if(channel == 1) yel_displaying(display_data[1]);
			else gre_displaying(display_data[2]);
		}
	}
}

void down_time_display(void)//10ms  yi ci
{
	if(display_data[0] != 0)//红
	{
		if(red_displaying_flag == 0)//开始倒计时
		{
			red_displaying_flag = 1;	
			gre_displaying_flag = 0;
			yel_displaying_flag = 0;
			display_data[2] = 0;
			display_data[1] = 0;
			syn_wink_display_updata = 1;
			displaying_second_counter = 0;
		}
	}

	if(display_data[1] != 0)//黄
	{
		if(yel_displaying_flag == 0)//开始倒计时	
		{	
			yel_displaying_flag = 1;
			displaying_second_counter = 0;
			red_displaying_flag = 0;
			gre_displaying_flag = 0;
			display_data[0] = 0;
			display_data[2] = 0;
			syn_wink_display_updata = 1;
		}
	}

	if(display_data[2] != 0)//绿
	{
		if(gre_displaying_flag == 0)//开始倒计时
		{
			gre_displaying_flag = 1;
			red_displaying_flag = 0;
			yel_displaying_flag = 0;
			display_data[0] = 0;
			display_data[1] = 0;
			syn_wink_display_updata = 1;
			displaying_second_counter = 0;
		}
	}

	if(red_displaying_flag == 1)
	{
		displaying_second_counter++;
		if(displaying_second_counter >= 100)
		{
			displaying_second_counter = 0;
			if(display_data[0] <= 1)
			{
				red_displaying_end();
				red_displaying_flag = 0;
				display_data[0] = 0;
			}
			else 
			{
				display_data[0]--;
				syn_wink_display_updata = 1;
				if(display_data[0] == 1) displaying_second_counter = AHEAD_END_TIME;	
			}
		}
		syn_wink_manage(0);
	}

	if(yel_displaying_flag == 1)
	{
		displaying_second_counter++;
		if(displaying_second_counter >= 100)
		{
			displaying_second_counter = 0;
			if(display_data[1] <= 1)
			{
				yel_displaying_end();
				yel_displaying_flag = 0;
				display_data[1] = 0;
			}
			else 
			{
				display_data[1]--;
				syn_wink_display_updata = 1;
				if(display_data[1] == 1) displaying_second_counter = AHEAD_END_TIME;	
			}
		}
		syn_wink_manage(1);
	}

	if(gre_displaying_flag == 1)
	{
		displaying_second_counter++;
		if(displaying_second_counter >= 100)
		{
			displaying_second_counter = 0;
			if(display_data[2] <= 1) 
			{
				gre_displaying_end();
				gre_displaying_flag = 0;
				display_data[2] = 0;	
			}
			else
			{
				display_data[2]--;
				syn_wink_display_updata = 1;
				if(display_data[2] == 1) displaying_second_counter = AHEAD_END_TIME;
			}
		}
		syn_wink_manage(2);
	}
}	

void filterAC_DC(void)//每1MS采样一次
{
	unsigned char i;
	unsigned char temp_var1;
	unsigned char temp_var2;
	lamp_temp_state = LAMP_STATE;
	if(lamp_temp_state == 4)lamp_temp_state = 6; //红黄同亮

	temp_var1 = lamp_temp_state ^ lamp_stab_state;
	if(temp_var1!=0)
	{
		temp_var2 = 0x01;
		for(i=0;i<3;i++)
		{
			if((temp_var1 & temp_var2)==temp_var2)
			{
				if((lamp_stab_state & temp_var2)==temp_var2)	//mei dao you
				{
					lamp_chge_counter[i]++;
					if(lamp_chge_counter[i] >= FILTER_ON_TIME)//3
					{
						lamp_stab_state ^= 	temp_var2;
						lamp_chge_counter[i] = 0;
					}
				}
				else											//you dao mei
				{
					lamp_chge_counter[i]++;
					if(lamp_chge_counter[i] >= FILTER_OFF_TIME)//19
					{
						lamp_stab_state ^= 	temp_var2;
						lamp_chge_counter[i] = 0;	
					}			
				}		
			}
			else
			{
				lamp_chge_counter[i] = 0;	
			}
			temp_var2 <<= 1;	
		}	
	}
	else
	{
		lamp_chge_counter[0] = 0;
		lamp_chge_counter[1] = 0;
		lamp_chge_counter[2] = 0;	
	}	
}


void study_mode_filterAC_DC(void)//10毫秒调用一次calculation
{
	unsigned char i;
	unsigned char temp_var1;
	unsigned char temp_var2;
	unsigned char temp_var3;

	temp_var1 = 0x01;
	lamp_stab_state &= 0x07;
	temp_var2 = lamp_stab_state ^ study_lamp_stab_state;//study_lamp_stab_state学习模式下的稳定状态

	if(temp_var2 != 0)
	{
		for(i=0;i<3;i++)
		{
			if((temp_var2&temp_var1)==temp_var1)
			{
				study_chge_counter[i]++;
				if((study_lamp_stab_state&temp_var1)==temp_var1)//mei dao you
				{
					if(study_chge_counter[i] >= 10)
					{
						study_chge_counter[i] = 0;
						study_lamp_stab_state ^= temp_var1;
					}
				}
				else
				{
					temp_var3 = (~temp_var1)&0x07;
					if((study_lamp_stab_state&temp_var3) == temp_var3)
					{
						if(study_chge_counter[i] >= 75)
						{
							study_chge_counter[i] = 0;
							study_lamp_stab_state ^= temp_var1;			
						}	
					}
					else
					{
						study_chge_counter[i] = 0;
						study_lamp_stab_state ^= temp_var1;	
					}
				}	
			}
			else
			{
				study_chge_counter[i] = 0;	
			}
			temp_var1 <<= 1;			
		}
	}
	else
	{
		study_chge_counter[0] = 0;
		study_chge_counter[1] = 0;
		study_chge_counter[2] = 0;	
	}	
}

void study_mode_time_calculation(void)//10ms yici
{
	unsigned char i;
	unsigned char temp_var1;
	unsigned int temp_var2;
	study_lamp_stab_state &= 0x07;
	temp_var1 = 0x01;
	for(i=0;i<3;i++)
	{
		if(study_lamp_stab_state==((~temp_var1)&0x07))//有灯坏 且为常亮的情况则学习模式下将不显示
		{
			if((study_time_flag&temp_var1)==0)//没 进行学习计数 灯刚点亮
			{
				study_time_flag |= temp_var1;
				current_study_counter[i]=0;

				if((i==2)||(i==0))//连续一个周期都没有触发脉冲 就自动跳到学习模式
				{
					if(communication_flag == 1)//在通讯模式下如果连续一个周期都没有通讯数据则切换到非通讯模式下	
					{
						communication_counter++;
						if(communication_counter >= 3)
						{
							communication_counter = 0;
							communication_flag = 0;
						}	
					}
					if(communication_flag == 0)//学习模式        只有红灯和绿灯分学习模式脉冲模式
					{
						if((study_time_valid_flag&temp_var1)==temp_var1)//学习的数据OK
						{
							if(previous_study_counter[i] >= 60000) display_data[i] = 0;
							else 
							{
								display_data[i] = (previous_study_counter[i]+18)/100;//////////红灯和绿灯的学习时间触发
								if(i==0)red_displaying_flag = 0;//重新开始倒计时
								if(i==2)gre_displaying_flag = 0;
							}
						}	
					}	
				}
				else//为黄灯
				{
					if((study_time_valid_flag&temp_var1)==temp_var1)
					{
						yel_displaying_flag = 0;
						if(previous_study_counter[i] >= 60000) display_data[i] = 0;
						display_data[i] = (previous_study_counter[i]+18)/100;	//黄灯的学习时间触发
					}	
				}
			}
			else//为黄灯
			{
				current_study_counter[i]++;
				if(current_study_counter[i] >= 60000) current_study_counter[i] = 60000;
				if((pulse_study_time_flag & temp_var1)==temp_var1) pulse_study_time_counter[i]++;//mai chong
			}
		}
		else//不是110 101 011这三种状态时
		{
			if((study_time_flag&temp_var1)==temp_var1)// 一个状态结束,计数状态有效
			{
				study_time_flag &= ~temp_var1;

				if(previous_study_counter[i] >= current_study_counter[i])
				{
					temp_var2 = previous_study_counter[i]-current_study_counter[i];
				}
				else
				{
					temp_var2 = current_study_counter[i]-previous_study_counter[i];
				}
				if((lamp_counter_valid_flag & temp_var1)==temp_var1)
				{
					if(STUDY_MODE == 0)//如果为单周期模式
					{
						if(temp_var2 > DEVIATION_TIME)
						{
							if(previous_study_counter[i] != 0)
							{
								previous_study_counter[0] = 0;	
								previous_study_counter[1] = 0;
								previous_study_counter[2] = 0;
								if(communication_flag == 0)
								{
									display_data[0] = 0;
									display_data[1] = 0;
									display_data[2] = 0;
								}
								study_time_valid_flag = 0;
							}
						}
						previous_study_counter[i] = current_study_counter[i];
						study_time_valid_flag |= temp_var1;	
					}
					else//为双周期模式
					{
						if(temp_var2 <= DEVIATION_TIME)
						{
							study_time_valid_flag |= temp_var1;	
							previous_study_counter[i] = current_study_counter[i];
						}
						else
						{
							if(previous_study_counter[i] != 0)
							{
								previous_study_counter[0] = 0;	
								previous_study_counter[1] = 0;
								previous_study_counter[2] = 0;
								if(communication_flag == 0)
								{
									display_data[0] = 0;
									display_data[1] = 0;
									display_data[2] = 0;
								}
							}
							previous_study_counter[i] = current_study_counter[i];//STUDY_MODE	
							study_time_valid_flag = 0;
						}	
					}
				}	
			}
			if(communication_flag == 0)
			{
				if(i==0)
				{
					if(red_displaying_flag == 1)
					{
						red_displaying_flag = 0;
						display_data[0] = 0;
						red_displaying_end();
					}	
				}

				if(i==1)
				{
					if(yel_displaying_flag == 1)
					{
						yel_displaying_flag = 0;
						display_data[1] = 0;
						yel_displaying_end();
					}	
				}

				if(i==2)
				{
					if(gre_displaying_flag == 1)
					{
						gre_displaying_flag = 0;
						display_data[2] = 0;
						gre_displaying_end();	
					}
				}

				if((pulse_study_time_flag&temp_var1)==temp_var1)
				{
					if(pulse_down_times[i] >= pulse_study_time_counter[i]) temp_var2 = pulse_down_times[i] - pulse_study_time_counter[i]; 
					else temp_var2 = pulse_study_time_counter[i] - pulse_down_times[i];
					if(temp_var2 > DEVIATION_TIME)
					{
						if(pulse_down_times[i] != 0)
						{
							pulse_down_time_valid_flag = 0;	
							pulse_down_times[0] = 0;
							pulse_down_times[1] = 0;
							pulse_down_times[2] = 0;
						}
					}
					pulse_down_times[i] = pulse_study_time_counter[i];
					pulse_down_time_valid_flag |= temp_var1;
					pulse_study_time_flag &= ~temp_var1;
				}
			}
		}
		if(((study_lamp_stab_state&temp_var1)==temp_var1)&&(study_lamp_stab_state!=0x07)) 
		{
			if(temp_var1 == 0x01)//红灯
			{
				if(restart_flag != 0) lamp_counter_valid_flag |= temp_var1;
			}
			else lamp_counter_valid_flag |= temp_var1;//红灯和绿灯的有效状态 //当前状态是一个完整的状态,经过状态切换后的状态才是一个完整的状态,避免因为刚上电时状态的不完整
		}
		temp_var1 <<= 1;                                
	}	
}

void lamp_err_state_check(void)//10ms 调用一次
{
	if((study_lamp_stab_state & 0x01)==0) restart_flag = 0x55;//重启的第一个红灯无效

	if((study_lamp_stab_state&0x07)==0x07)//3个灯都没亮超过1200毫秒后会重新学习
	{
		no_lamp_on_counter++;
		if(no_lamp_on_counter >= 100)
		{
			no_lamp_on_counter = 0;
			study_time_valid_flag = 0;	
			previous_study_counter[0] = 0;
			previous_study_counter[1] = 0;
			previous_study_counter[2] = 0;
			lamp_counter_valid_flag = 0;
			pulse_down_time_valid_flag = 0;
		}
	}
	else no_lamp_on_counter	= 0;
	
	switch(study_lamp_stab_state&0x07)
	{
		case 0:
		case 1:
		case 2:
		case 4:
			sametime_on_counter++;
			if(sametime_on_counter >= 50)//同亮超过300毫秒
			{
				sametime_on_counter = 0;
				study_time_valid_flag = 0;
				lamp_counter_valid_flag = 0;
				pulse_down_time_valid_flag = 0;
			}	
			break;
		default:
			sametime_on_counter = 0;
			break;
	}
	
}

void G_Segment_Wink(void)//100mS调用一次 
{
        unsigned char i;
        unsigned char temp_data1;
        unsigned char temp_data2;
        if(communication_flag == 0)//不是通讯模式
        {
            temp_data1 = 0x01;
            for(i=0;i<3;i++)
            {
                temp_data2 = 0;
                if(study_lamp_stab_state == ((~temp_data1)&0x07))
                {
                      if((study_time_valid_flag&temp_data1)==0) temp_data2 = 1;
                }

                if(temp_data2 == 1)
                {
                      temp_data2 = 0;
                      if(g_segment_wink_state_flag != temp_data1)
                      {
                            g_segment_wink_time_counter = 9;
                            g_segment_wink_state_flag = temp_data1;
                            g_segment_wink_display_flag = 0;//mie   
                     }
                     else
                     {
                           g_segment_wink_time_counter--;
                           if(g_segment_wink_time_counter == 0)
                           {
                                g_segment_wink_time_counter = 10;
                                if(g_segment_wink_display_flag == 1) g_segment_wink_display_flag = 0;
                                else  g_segment_wink_display_flag = 1;     
                           }      
                     }
                }
                else
                {
                      g_segment_wink_state_flag &= (~temp_data1);  
                }

               if(g_segment_wink_state_flag == temp_data1)
               {
                      if(g_segment_wink_display_flag == 1)  g_segment_displaying(i);
                      else  gre_displaying_end();
                }    
                temp_data1 <<= 1;         
            }
        }
        else g_segment_wink_state_flag = 0;                
}

void g_segment_afresh_analyse(void)//10mm调用一次 
{
	if(g_segment_afresh_state != study_time_flag)
	{
		g_segment_afresh_state = study_time_flag;
		g_segment_afresh_counter = 0;
		g_segment_afresh_number = 3;
		if((study_time_valid_flag&g_segment_afresh_state) != 0)
		{
			switch(g_segment_afresh_state)
			{
				case 0x01:
					g_segment_afresh_number = 0;	
				break;
				case 0x02:
					g_segment_afresh_number = 1;	
				break;
				case 0x04:
					g_segment_afresh_number = 2;
				break;
				default:
				break;	
			}
		}
	}
	if(g_segment_afresh_number < 3)
	{
		g_segment_afresh_counter++;
		if(g_segment_afresh_counter >= 100)//pulse_study_time_counter   pulse_down_times
		{
			g_segment_afresh_counter = 0;
			if(current_study_counter[g_segment_afresh_number] > previous_study_counter[g_segment_afresh_number])
			{
				if((current_study_counter[g_segment_afresh_number] - previous_study_counter[g_segment_afresh_number]) > DEVIATION_TIME) 
				{
					study_time_valid_flag = 0;
					g_segment_afresh_number = 3;
				}
			}	
		}
	}
}    

//---------------------------------------
//名称: T0中断函数（500US）		 
//----------------------------------------- 
void interrupt  ISR(void)
{
	if(TMR1IF == 1)
	{
		TMR1IF = 0;
		TMR1H=0xFB;             //赋初值，以便TMR1每250US中断一次
		TMR1L=0x85;
		TFG=1;	
	}
	if(RCIF == 1)
	{
		usart_rx_buffer[usart_rx_write] = RCREG;
		usart_rx_write++;
		if(usart_rx_write >= RX_LENGTH) usart_rx_write=0;
		if(OERR == 1)
		{
			CREN = 0;
			CREN = 1;
		}	
	}
}

void usart_data_analyse(void)
{
	unsigned char k;
	unsigned char CheckSum;
	unsigned char temp_pointer;
	unsigned char TableLength;
	unsigned int down_time;
	if(usart_rx_read != usart_rx_write)
	{
		TableLength = 0;
		if((usart_rx_read >= RX_LENGTH)||(usart_rx_write >= RX_LENGTH))
		{
			usart_rx_read = 0;	
			usart_rx_write = 0;
		}
		else
		{
			if(usart_rx_read<usart_rx_write) TableLength = usart_rx_write - usart_rx_read;
			else TableLength = 	RX_LENGTH - (usart_rx_read - usart_rx_write);
		}

		if(TableLength >= 5)
		{
			if(usart_rx_buffer[usart_rx_read] == TABLEHEAD)	
			{
				temp_pointer = usart_rx_read;
				for(k=0;k<5;k++)
				{
					usart_temp_buffer[k] = usart_rx_buffer[temp_pointer];
					temp_pointer++;
					if(temp_pointer >= RX_LENGTH) temp_pointer = 0;
				}
					
				CheckSum = 0;
				for(k=1;k<4;k++)
				{
					CheckSum ^= usart_temp_buffer[k];
				}
				CheckSum &= 0x7f;

				if(CheckSum == usart_temp_buffer[4])//校验OK  
				{
					if((usart_temp_buffer[2] <= 0x99)&&(usart_temp_buffer[3] <= 0x99))
					{
						if((usart_temp_buffer[1]&0xdc) == address_of_lamp)//地址OK
						{
							communication_flag = 1;//当前模式为通讯模式
							communication_counter = 0;

							down_time = ((usart_temp_buffer[2]>>4)&0x0f)*1000;
							down_time += (usart_temp_buffer[2]&0x0f)*100;
							down_time += ((usart_temp_buffer[3]>>4)&0x0f)*10;
							down_time += (usart_temp_buffer[3]&0x0f);
							if((usart_temp_buffer[1]&0x20)!=0)//自动每秒
							{
								switch(usart_temp_buffer[1]&0x03)
								{
									case 0://black
										red_displaying_end();
										red_displaying_flag = 0;
										gre_displaying_flag=0;
										yel_displaying_flag=0;
										display_data[0] = 0;
										display_data[1] = 0;
										display_data[2] = 0;
										break;
									case 2://yellow
										display_data[1] = down_time;
										if(red_displaying_flag == 1)
										{
											red_displaying_flag = 0;
											red_displaying_end();
											display_data[0] = 0;
										}
										if(gre_displaying_flag == 1)
										{
											gre_displaying_flag=0;
											display_data[2] = 0;
											gre_displaying_end();
										}
										break;
									case 1://green
										display_data[2] = down_time;
										if(red_displaying_flag == 1)
										{
											red_displaying_flag = 0;
											red_displaying_end();
											display_data[0] = 0;
										}
										if(yel_displaying_flag == 1)
										{
											yel_displaying_flag=0;
											display_data[1] = 0;
											yel_displaying_end();
										}
										break;
									case 3://red
										display_data[0] = down_time;
										if(gre_displaying_flag == 1)
										{
											gre_displaying_flag=0;
											display_data[2] = 0;
											gre_displaying_end();
										}
										if(yel_displaying_flag == 1)
										{
											yel_displaying_flag=0;
											display_data[1] = 0;
											yel_displaying_end();
										}
										break;
									default:
										break;
								}
							}
							else//显示当前秒
							{
								if(red_displaying_flag == 1)
								{
									red_displaying_flag = 0;
									red_displaying_end();
									display_data[0] = 0;
								}
								if(gre_displaying_flag == 1)
								{
									gre_displaying_flag=0;
									display_data[2] = 0;
									gre_displaying_end();
								}
								if(yel_displaying_flag == 1)
								{
									yel_displaying_flag=0;
									display_data[1] = 0;
									yel_displaying_end();
								}							
								switch(usart_temp_buffer[1]&0x03)
								{
									case 0:
										red_displaying_end();
										break;
									case 2://yellow
										yel_displaying(down_time);
										every_second_update_flag = 1;
										every_second_update_counter = 0;
										every_second_update_delay = 0;
										break;
									case 1://green
										gre_displaying(down_time);
										every_second_update_flag = 1;
										every_second_update_counter = 0;
										every_second_update_delay = 0;
										break;
									case 3://red
										red_displaying(down_time);
										every_second_update_flag = 1;
										every_second_update_counter = 0;
										every_second_update_delay = 0;
										break;
									default:
										break;
								}
							}		
						}
					}
					else
					{
						if((usart_temp_buffer[2] == 0xaa)&&(usart_temp_buffer[3] == 0xbb))//
						{
							addr_write(usart_temp_buffer[1]&0xdc);//取D7,D6,D4,D3,D2的值
							address_of_lamp = usart_temp_buffer[1]&0xdc;	
						}
						if((usart_temp_buffer[2] == 0xcc)&&(usart_temp_buffer[3] == 0xdd)&&(usart_temp_buffer[1] == 0x00))//
						{
							address_of_lamp = addr_read();
							communication_flag = 1;
							red_displaying(address_of_lamp);
						}
					}

					if(usart_rx_read < temp_pointer) TableLength = temp_pointer - usart_rx_read;//TableLength
					else TableLength = RX_LENGTH - (usart_rx_read - temp_pointer);
					for(k=0;k<TableLength;k++)
					{
						usart_rx_buffer[usart_rx_read]=0;
						usart_rx_read++;
						if(usart_rx_read >= RX_LENGTH) 	usart_rx_read = 0;	
					}		
				}
				else//校验不通过
				{
					usart_rx_buffer[usart_rx_read]=0;
					usart_rx_read++;
					if(usart_rx_read >= RX_LENGTH) 	usart_rx_read = 0;	
				}
			}
			else //表头不对
			{
				usart_rx_buffer[usart_rx_read]=0;
				usart_rx_read++;
				if(usart_rx_read >= RX_LENGTH) 	usart_rx_read = 0;
			}			
		}
	}			
}
void communication_err(void)
{
	every_second_update_counter++;
	if(every_second_update_counter >= 100)
	{
		every_second_update_counter = 0;
		every_second_update_delay++;
		if(every_second_update_delay >= LOST_DELAY_TIME)
		{
			every_second_update_flag = 0;
			every_second_update_counter = 0;
			every_second_update_delay = 0;
			red_displaying_end();
//			gre_displaying_end();///////////
//			yel_displaying_end();//////////	
		}
	}	
}


//---------------------------------------
//名称: 主函数		 
//日期：20140515
//----------------------------------------- 

void main(void)
{
	unsigned char k;
	unsigned int i;

	for(k=0;k<2;k++)
	{	 
 		ioinit();
		change_DM13H();
		RB4=0;
		red_displaying_end();
		gre_displaying_end();
		yel_displaying_end();
		for(i=0;i<6000;i++);
	}
	timer1init(); 
	usartinit(); 
	address_of_lamp = addr_read();
	WDTENABLE;

  	while(1)
  	{ 		
    	if(TFG==1)
		{
			TFG = 0;
			wdtcounter++;
            g_segment_100ms_counter++;
			filterAC_DC();

			ten_mm_counter++;
			if(ten_mm_counter >= 10)
			{
				ten_mm_counter = 0;
				study_mode_filterAC_DC();
				study_mode_time_calculation();
				down_time_display();
				lamp_err_state_check();
				if(every_second_update_flag == 1)
				{
					communication_err();	
				}
				g_segment_afresh_analyse();
			}
			usart_data_analyse();
		}

		if(wdtcounter >= 240)//240ms定时喂狗
		{
			wdtcounter = 0;
			CLRWDT();

			if(ledstate == 0)
			{
				RB6 = 0;
				ledstate=1;
			}
			else
			{
				RB6 = 1;
				ledstate = 0;
				RC5=1;//rs485 接收
			}

		}

           if(g_segment_100ms_counter >= 50)
           {
                  g_segment_100ms_counter = 0;
			 if((red_displaying_flag == 0)&&(yel_displaying_flag == 0)&&(gre_displaying_flag == 0))
			 {
                  	if(G_SEGMENT_WINK_FLAG == 1)
                  	{
                   	     G_Segment_Wink();     
                  	}
			 }
           }
			
  	}
}
