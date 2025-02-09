#include "main.h"
#ifndef _HCSR04_H_
#define _HCSR04_H_

#define TRIG_PIN GPIO_PIN_7
#define TRIG_PORT GPIOA
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim);
void Delay(uint16_t time);
void HCSR04_Read (void);
extern uint8_t Distance;
#endif
