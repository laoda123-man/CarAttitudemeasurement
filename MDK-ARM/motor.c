#include "motor.h"
#include "tim.h"
#include "oled.h"
#include "hc05.h"




void xun(int Line_X)
{
    int Target_X = 0; //���Ŀ��λ��
    float KP = 1.0; //���KPֵ����Ҫ���Լ�����

    int Error = Target_X - Line_X; //�������
    int degree = -15*KP*Error+1500; //��KP*����������Ƕ�

    if (Line_X<-40)Line_X=-40;
    if(Line_X>40)Line_X=40;
    if(degree<1000)degree=1000;
    if(degree>2000)degree=2000;

    __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_1,degree);
	MotorControl(MotorLeft,3500);
	MotorControl(MotorRight,3500);
}




void MotorControl(uint8_t con,	short speed)
{

	 if (speed < 0) /* �жϽ��� */
    {
        con++;
        speed = -speed;
    }
    if (speed > MaxSpeed) /* �ٶ��޷� */
    {
        speed = MaxSpeed;
    }
    if (speed < MinSpeed) /* ��С�ٶ� */
    {
        speed = MinSpeed;
    }
    switch (con)
    {
    case 0: /* ����ǰ�� */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_3,speed);		//PWMA  ����
        AIN1_H;
        AIN2_L;
        break;
    case 1: /* �������� */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_3,speed);		//PWMA  ����
        AIN1_L;
        AIN2_H;
        break;
    case 2: /* �ҵ��ǰ�� */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_4,speed);		//PWMB  �ҵ��
        BIN1_H;
        BIN2_L;
        break;
    case 3: /* �ҵ������ */
         __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_4,speed);		//PWMB  �ҵ��
        BIN1_L;
        BIN2_H;
        break;
    default:
         PWMA;		
         PWMB;		
        AIN1_L;
        AIN2_L;
        BIN1_L;
        BIN2_L;
        break;
    }

}

void GetEncoderValue(short *LEFT_ENC_COUNTER,short *RIGHT_ENC_COUNTER)
{
  	//��ȡ�����������
		*LEFT_ENC_COUNTER = (short)(__HAL_TIM_GET_COUNTER(&htim2)); //��ȡtim2����
	  __HAL_TIM_SET_COUNTER(&htim2,0);														//����������
	
	  //��ȡ�ұ���������
    *RIGHT_ENC_COUNTER = (short)(__HAL_TIM_GET_COUNTER(&htim4)); //��ȡtim4����
	  __HAL_TIM_SET_COUNTER(&htim4,0);														 //����������	
}

