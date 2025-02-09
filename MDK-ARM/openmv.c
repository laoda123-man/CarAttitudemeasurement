#include "openmv.h"

#define frame_header 0xA5  //��ͷ
uint8_t openmv_rxbuffer[2] = {0};				//��������
int openmv_x;					//������


void OPENMV_INIT()
{
	HAL_UART_Receive_IT(OPENMV_UART, openmv_rxbuffer, 2);		//ÿ���жϽ���32���ַ�
}

void OPENMV_READ()
{	
	if(openmv_rxbuffer[0] == (frame_header))		//�ж���ͷ
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
