#include "openmv.h"

#define frame_header 0xA5  //桢头
uint8_t openmv_rxbuffer[2] = {0};				//接收数组
int openmv_x;					//横坐标


void OPENMV_INIT()
{
	HAL_UART_Receive_IT(OPENMV_UART, openmv_rxbuffer, 2);		//每次中断接收32个字符
}

void OPENMV_READ()
{	
	if(openmv_rxbuffer[0] == (frame_header))		//判断桢头
	{	
		openmv_x = openmv_rxbuffer[1] - 40;
	}
	HAL_UART_Receive_IT(OPENMV_UART, openmv_rxbuffer, 2);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if(huart->Instance==OPENMV_UART_INSTANCE)
	{
	OPENMV_READ();	 
	}
}
