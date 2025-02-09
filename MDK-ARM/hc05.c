#include "hc05.h"
#include <string.h>
#include "usart.h"
#include "oled.h"
#include "motor.h"

uint8_t bluetooth_rxbuffer;	   



void bluetooth_INIT()
{
	HAL_UART_Receive_IT(&huart2,(uint8_t *)&bluetooth_rxbuffer,1);
}

void HAL_UART_RxCpltCallback2(UART_HandleTypeDef *huart)
{
	if(huart->Instance==USART2)
	{
	bluetooth_INIT();

	}
	HAL_UART_Receive_IT(&huart2,(uint8_t *)&bluetooth_rxbuffer,1);
}
