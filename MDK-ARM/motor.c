#include "motor.h"
#include "tim.h"
#include "oled.h"
#include "hc05.h"




void xun(int Line_X)
{
    int Target_X = 0; //你的目标位置
    float KP = 1.0; //你的KP值，需要你自己调整

    int Error = Target_X - Line_X; //计算误差
    int degree = -15*KP*Error+1500; //用KP*误差来调整角度

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

	 if (speed < 0) /* 判断进退 */
    {
        con++;
        speed = -speed;
    }
    if (speed > MaxSpeed) /* 速度限幅 */
    {
        speed = MaxSpeed;
    }
    if (speed < MinSpeed) /* 最小速度 */
    {
        speed = MinSpeed;
    }
    switch (con)
    {
    case 0: /* 左电机前进 */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_3,speed);		//PWMA  左电机
        AIN1_H;
        AIN2_L;
        break;
    case 1: /* 左电机后退 */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_3,speed);		//PWMA  左电机
        AIN1_L;
        AIN2_H;
        break;
    case 2: /* 右电机前进 */
        __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_4,speed);		//PWMB  右电机
        BIN1_H;
        BIN2_L;
        break;
    case 3: /* 右电机后退 */
         __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_4,speed);		//PWMB  右电机
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
  	//读取左编码器脉冲
		*LEFT_ENC_COUNTER = (short)(__HAL_TIM_GET_COUNTER(&htim2)); //读取tim2脉冲
	  __HAL_TIM_SET_COUNTER(&htim2,0);														//计数器清零
	
	  //读取右编码器脉冲
    *RIGHT_ENC_COUNTER = (short)(__HAL_TIM_GET_COUNTER(&htim4)); //读取tim4脉冲
	  __HAL_TIM_SET_COUNTER(&htim4,0);														 //计数器清零	
}

