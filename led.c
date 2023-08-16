#include <pic.h>       //����ͷ�ļ�������ȥPICC�����ȥ����PIC16F88X��Ƭ����ͷ�ļ�
__CONFIG(0x23a2);
__CONFIG(0x3fff);//����д�����رգ����縴λ��ѹ��Ϊ4v    //���������֣��������ͣ�XT���رտ��Ź�����ֹ�͵�ѹ��̣���ֹǷѹ��λ
//RC2 ������룻RC3 �Ƶ����룻RC4 �̵�����
//RB0 ����ʾ���ݳ���RB1 ������Ϊ�����RB2 ����ʾ���ݳ���RB3 ʱ�������RB5 �����źţ�RB4�Ƶƿ���
//RB6 ���ϵ�ָʾ��
//RB4=1ʱ���Ƶ�
//����ʾU1(5��7��9��11, 13��15��17)   U2(5��7��9��11, 13��15��17) ��U1���λU2��ʮλ��
//����ʾU3(5��6)(7��8)(9, 10)(11��12)(13��14)(15��16)(17��18)   U4(5��6)(7��8)(9, 10)(11��12)(13��14)(15��16)(17��18)
//1(0x0500),2(0x1451),3(0x1541),4(0x0505),5(0x1145),6(0x1155),7(0x1500),8(0x1555),9(0x1545),0(0x1554);��(0x0000)����ʾ������
//1(0x0f00),2(0x3cf3),3(0x3fc3),4(0x0f0f),5(0x33cf),6(0x3ff3),7(0x3f00),8(0x3fff),9(0x3fcf),0(0x3ffc);��(0x0000)����ʾ������
//////////////////////
//Ӳ���޸�˵����ȥ������C9��C10��C11;����C35��C36��37����22nF/50;ȥ������C41��C42��C43;����Ԫ������
//����ͬ��������ʾ;���ֶ�·��ʾ������,��·�Ĳ���ʾ
//*******�����޸ĵĲ���********************************************************
#define STUDY_MODE 1           //0��ʾ������  1��ʾ˫����
#define PULSE_MIN 80           //������������Сֵ(��ҪС��80)
#define PULSE_MAX 350          //�������������ֵ
#define G_SEGMENT_WINK_FLAG  0 //1��ʾG�ֶ���ѧϰʱ��˸��0��ʾG�ֶ���ѧϰʱ����˸.
#define DISPLAY_SYN_WINK     1 //1��ʾ����ʱ�͵�ͬ����˸��0��ʾ����˸��
//*****************************************************************************
#define LAMP_STATE		((PORTC>>2)&0x07)

#define FILTER_ON_TIME  2
#define FILTER_OFF_TIME 21
#define PULSE_SAMPLE_MIN (PULSE_MIN-34)//�����30
#define PULSE_SAMPLE_MAX (PULSE_MAX+5)
#define DEVIATION_TIME 140 //����ѧϰʱ��1.4��
#define WDTENABLE PSA = 0;WDTCON = 0X15;
#define AHEAD_END_TIME 2

#define RX_LENGTH 30
#define BAUD_RATE_9600 SPBRGH=0X00;SPBRG=0X77;//119
#define LOST_DELAY_TIME 3  //��ÿ�뷢�͵�ǰ��ʾʱ��ʱ���3��û���յ���һ������ص�
#define EEPRADDR 0x10//�洢��ַ��λ��0X00-0XFF
//	RC5=0���ͣ�RC5=1����
#define TABLEHEAD 0xfe

//////////////////////
unsigned char TFG;
unsigned char lamp_stab_state;
unsigned char lamp_temp_state;
unsigned char lamp_chge_counter[3];//20MS�˲�������
unsigned char no_lamp_on_counter;
unsigned char lamp_counter_valid_flag;//������Ч��־

unsigned char lamp_on_flag;
unsigned int lamp_on_counter[3];
unsigned char lamp_off_flag;
unsigned int lamp_off_counter[3];
unsigned char lamp_off_time[3];//��¼��ÿ�ε�������,�ڸտ�ʼ��ʾ����һ���м���ȥ
unsigned char g_segment_wink_time_counter;
unsigned char g_segment_wink_state_flag;
unsigned char g_segment_wink_display_flag;
unsigned char g_segment_100ms_counter;
unsigned char g_segment_afresh_state;
unsigned char g_segment_afresh_counter;
unsigned char g_segment_afresh_number;
unsigned char syn_wink_display_state;//ͬ����˸
unsigned char syn_wink_display_updata;//Ϊ1��ʾ����ʾ���ݸ��¡�

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
bank1 unsigned char communication_flag;//1��ʾͨѶģʽ
bank1 unsigned char communication_counter;

bank1 unsigned char red_displaying_flag;
bank1 unsigned char gre_displaying_flag;
bank1 unsigned char yel_displaying_flag;
bank1 unsigned char displaying_second_counter;

bank1 unsigned char restart_flag;//�������ĵ�һ�����ʱ���ǲ��Ե�(����) �ڶ��������Ч

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
	//RB0 ����ʾ���ݳ���RB3 ʱ�������RB5 �����ź�
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
	OSCCON=0X08;    		//ϵͳʱ����CONFIG����	
	ANSEL=0X00;  			//����IOΪ����IO
  	ANSELH=0X00;  			//����IOΪ����IO
	nRBPU = 1;//RB������ֹ
	PORTB=0B00000000;       //���LED_a-LED_dp 
  	TRISB=0B00000000;   	    //RD����Ϊ���
	TRISC=0B00011100;       //RC2,RC3,RC4����Ϊ����

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
	communication_flag = 0;//0��ͨѶģʽ 1ͨѶģʽ
	communication_counter=0;
	address_of_lamp = 0xff;
	
	every_second_update_flag = 0;
	every_second_update_counter = 0;
	every_second_update_delay = 0;
	RC5=1;//485����ģʽ

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
	SPEN = 1;//IO��
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
//����: T1��ʼ������		 
//----------------------------------------- 
void timer1init(void)
{
	T1CON=0X21;	//4��Ƶ  FOSC/4
	TMR1IF=0;                //���TMR1�жϱ�־
	TMR1IE=1;                //TMR1�ж�����	
	TMR1H=0xFB;             //����ֵ���Ա�TMR1ÿ250US�ж�һ��
	TMR1L=0x85;
	PIR1=0;//��������жϱ�־
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
	//////���FORѭ��һ��Ҫ216US
	for(i=0;i<16;i++)
	{
		if((drvword & tempdata)==0)	RB0=0;
		else RB0=1;
		for(k=0;k<1;k++);//�ٶ���71K����
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

void syn_wink_manage(unsigned char channel)//�����ʱ�Ƿ������̵���˸
{
	unsigned char tempdata;
	
	if(DISPLAY_SYN_WINK == 1)//������˸
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
	if(display_data[0] != 0)//��
	{
		if(red_displaying_flag == 0)//��ʼ����ʱ
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

	if(display_data[1] != 0)//��
	{
		if(yel_displaying_flag == 0)//��ʼ����ʱ	
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

	if(display_data[2] != 0)//��
	{
		if(gre_displaying_flag == 0)//��ʼ����ʱ
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

void filterAC_DC(void)//ÿ1MS����һ��
{
	unsigned char i;
	unsigned char temp_var1;
	unsigned char temp_var2;
	lamp_temp_state = LAMP_STATE;
	if(lamp_temp_state == 4)lamp_temp_state = 6; //���ͬ��

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


void study_mode_filterAC_DC(void)//10�������һ��calculation
{
	unsigned char i;
	unsigned char temp_var1;
	unsigned char temp_var2;
	unsigned char temp_var3;

	temp_var1 = 0x01;
	lamp_stab_state &= 0x07;
	temp_var2 = lamp_stab_state ^ study_lamp_stab_state;//study_lamp_stab_stateѧϰģʽ�µ��ȶ�״̬

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
		if(study_lamp_stab_state==((~temp_var1)&0x07))//�еƻ� ��Ϊ�����������ѧϰģʽ�½�����ʾ
		{
			if((study_time_flag&temp_var1)==0)//û ����ѧϰ���� �Ƹյ���
			{
				study_time_flag |= temp_var1;
				current_study_counter[i]=0;

				if((i==2)||(i==0))//����һ�����ڶ�û�д������� ���Զ�����ѧϰģʽ
				{
					if(communication_flag == 1)//��ͨѶģʽ���������һ�����ڶ�û��ͨѶ�������л�����ͨѶģʽ��	
					{
						communication_counter++;
						if(communication_counter >= 3)
						{
							communication_counter = 0;
							communication_flag = 0;
						}	
					}
					if(communication_flag == 0)//ѧϰģʽ        ֻ�к�ƺ��̵Ʒ�ѧϰģʽ����ģʽ
					{
						if((study_time_valid_flag&temp_var1)==temp_var1)//ѧϰ������OK
						{
							if(previous_study_counter[i] >= 60000) display_data[i] = 0;
							else 
							{
								display_data[i] = (previous_study_counter[i]+18)/100;//////////��ƺ��̵Ƶ�ѧϰʱ�䴥��
								if(i==0)red_displaying_flag = 0;//���¿�ʼ����ʱ
								if(i==2)gre_displaying_flag = 0;
							}
						}	
					}	
				}
				else//Ϊ�Ƶ�
				{
					if((study_time_valid_flag&temp_var1)==temp_var1)
					{
						yel_displaying_flag = 0;
						if(previous_study_counter[i] >= 60000) display_data[i] = 0;
						display_data[i] = (previous_study_counter[i]+18)/100;	//�ƵƵ�ѧϰʱ�䴥��
					}	
				}
			}
			else//Ϊ�Ƶ�
			{
				current_study_counter[i]++;
				if(current_study_counter[i] >= 60000) current_study_counter[i] = 60000;
				if((pulse_study_time_flag & temp_var1)==temp_var1) pulse_study_time_counter[i]++;//mai chong
			}
		}
		else//����110 101 011������״̬ʱ
		{
			if((study_time_flag&temp_var1)==temp_var1)// һ��״̬����,����״̬��Ч
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
					if(STUDY_MODE == 0)//���Ϊ������ģʽ
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
					else//Ϊ˫����ģʽ
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
			if(temp_var1 == 0x01)//���
			{
				if(restart_flag != 0) lamp_counter_valid_flag |= temp_var1;
			}
			else lamp_counter_valid_flag |= temp_var1;//��ƺ��̵Ƶ���Ч״̬ //��ǰ״̬��һ��������״̬,����״̬�л����״̬����һ��������״̬,������Ϊ���ϵ�ʱ״̬�Ĳ�����
		}
		temp_var1 <<= 1;                                
	}	
}

void lamp_err_state_check(void)//10ms ����һ��
{
	if((study_lamp_stab_state & 0x01)==0) restart_flag = 0x55;//�����ĵ�һ�������Ч

	if((study_lamp_stab_state&0x07)==0x07)//3���ƶ�û������1200����������ѧϰ
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
			if(sametime_on_counter >= 50)//ͬ������300����
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

void G_Segment_Wink(void)//100mS����һ�� 
{
        unsigned char i;
        unsigned char temp_data1;
        unsigned char temp_data2;
        if(communication_flag == 0)//����ͨѶģʽ
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

void g_segment_afresh_analyse(void)//10mm����һ�� 
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
//����: T0�жϺ�����500US��		 
//----------------------------------------- 
void interrupt  ISR(void)
{
	if(TMR1IF == 1)
	{
		TMR1IF = 0;
		TMR1H=0xFB;             //����ֵ���Ա�TMR1ÿ250US�ж�һ��
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

				if(CheckSum == usart_temp_buffer[4])//У��OK  
				{
					if((usart_temp_buffer[2] <= 0x99)&&(usart_temp_buffer[3] <= 0x99))
					{
						if((usart_temp_buffer[1]&0xdc) == address_of_lamp)//��ַOK
						{
							communication_flag = 1;//��ǰģʽΪͨѶģʽ
							communication_counter = 0;

							down_time = ((usart_temp_buffer[2]>>4)&0x0f)*1000;
							down_time += (usart_temp_buffer[2]&0x0f)*100;
							down_time += ((usart_temp_buffer[3]>>4)&0x0f)*10;
							down_time += (usart_temp_buffer[3]&0x0f);
							if((usart_temp_buffer[1]&0x20)!=0)//�Զ�ÿ��
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
							else//��ʾ��ǰ��
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
							addr_write(usart_temp_buffer[1]&0xdc);//ȡD7,D6,D4,D3,D2��ֵ
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
				else//У�鲻ͨ��
				{
					usart_rx_buffer[usart_rx_read]=0;
					usart_rx_read++;
					if(usart_rx_read >= RX_LENGTH) 	usart_rx_read = 0;	
				}
			}
			else //��ͷ����
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
//����: ������		 
//���ڣ�20140515
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

		if(wdtcounter >= 240)//240ms��ʱι��
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
				RC5=1;//rs485 ����
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
