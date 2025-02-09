#ifndef motor_H_
#define motor_H_
#include "main.h"

#define AIN1_H		HAL_GPIO_WritePin(AIN1_GPIO_Port, AIN1_Pin, GPIO_PIN_SET)
#define AIN1_L		HAL_GPIO_WritePin(AIN1_GPIO_Port, AIN1_Pin, GPIO_PIN_RESET)
#define AIN2_H		HAL_GPIO_WritePin(AIN2_GPIO_Port, AIN2_Pin, GPIO_PIN_SET)
#define AIN2_L		HAL_GPIO_WritePin(AIN2_GPIO_Port, AIN2_Pin, GPIO_PIN_RESET)
#define BIN1_H		HAL_GPIO_WritePin(BIN1_GPIO_Port, BIN1_Pin, GPIO_PIN_SET)
#define BIN1_L		HAL_GPIO_WritePin(BIN1_GPIO_Port, BIN1_Pin, GPIO_PIN_RESET)
#define BIN2_H		HAL_GPIO_WritePin(BIN2_GPIO_Port, BIN2_Pin, GPIO_PIN_SET)
#define BIN2_L		HAL_GPIO_WritePin(BIN2_GPIO_Port, BIN2_Pin, GPIO_PIN_RESET)
#define MaxSpeed 19999		//最大速度
#define MinSpeed 0		//最小速度
#define MotorLeft  0
#define MotorRight 2
#define PWMA __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_3,MinSpeed)
#define PWMB __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_4,MinSpeed)

void MotorControl(uint8_t con,	short speed);
void GetEncoderValue(short *LEFT_ENC_COUNTER,short *RIGHT_ENC_COUNTER);
void xun(int Line_X);


#endif /* MOTOR_H_ */
