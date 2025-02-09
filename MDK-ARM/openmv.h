#ifndef __OPENMV_H__
#define __OPENMV_H__
#include "gpio.h"
//#include "tim.h"
#include "main.h"
#include "usart.h"

#define OPENMV_UART				(&huart1)
#define OPENMV_UART_INSTANCE		(USART1)

void OPENMV_INIT(void);


#endif
