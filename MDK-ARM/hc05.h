#ifndef __HC05_H
#define __HC05_H

#include "main.h"

void bluetooth_INIT(void);
void HAL_UART_RxCpltCallback2(UART_HandleTypeDef *huart);

#endif /* __HC05_H */
