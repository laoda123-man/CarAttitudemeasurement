/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "oled.h"
#include "openmv.h"
#include "hcsr04.h"
#include "mpu6050.h"
#include "stdio.h"
#include "motor.h"
#include "stdbool.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
extern int openmv_x;
extern uint8_t openmv_rxbuffer[2];
extern uint8_t bluetooth_rxbuffer;
int x=1;
int flag,xflag ;
short SpeedL,SpeedR = 0;
int expectspeed = 200;
char letters[] = "CGSJ*";
int number1[3];
int number2[18];
short encoder[2];
float pid[5];
static int degree;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
int fputc(int ch, FILE *f)
{
uint8_t temp[1] = {ch};
HAL_UART_Transmit(&huart2, temp, 1, 2);//huart1需要根据你的配置修改
return ch;
}
int fgetc(FILE *f)
{
  uint8_t ch = 0;
  HAL_UART_Receive(&huart2, &ch, 1, 0xffff);
  return ch;
}
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
MPU6050_t MPU6050;


/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART1_UART_Init();
  MX_TIM1_Init();
  MX_TIM3_Init();
  MX_USART2_UART_Init();
  MX_TIM2_Init();
  MX_TIM4_Init();
  MX_I2C1_Init();
  /* USER CODE BEGIN 2 */
HAL_TIM_Encoder_Start(&htim2,TIM_CHANNEL_ALL);
HAL_TIM_Encoder_Start(&htim4,TIM_CHANNEL_ALL);
HAL_TIM_IC_Start_IT(&htim1,TIM_CHANNEL_1);
HAL_TIM_Base_Start_IT(&htim3);  									//
HAL_TIM_PWM_Start(&htim3,TIM_CHANNEL_1);
HAL_TIM_PWM_Start(&htim3,TIM_CHANNEL_3);
HAL_TIM_PWM_Start(&htim3,TIM_CHANNEL_4);
OLED_Init();
OLED_Clear();
OPENMV_INIT();
HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
HAL_UART_Receive_IT(OPENMV_UART, openmv_rxbuffer, 2);
while (MPU6050_Init(&hi2c1) == 1);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
GetEncoderValue(&SpeedL,&SpeedR);
HCSR04_Read();
OLED_ShowString(2,3,"d:");
OLED_ShowNum(2,5,Distance,3);
OLED_ShowString(3,1,"SL:");
OLED_ShowString(4,1,"SR:");
OLED_ShowSignedNum(3,4,SpeedL,3);
OLED_ShowSignedNum(4,4,SpeedR,3);		
OLED_ShowSignedNum(1,1,openmv_x,3);
MPU6050_Read_All(&hi2c1, &MPU6050);
MPU6050_Read_Accel(&hi2c1, &MPU6050);
MPU6050_Read_Gyro(&hi2c1, &MPU6050);
MPU6050_Read_Temp(&hi2c1, &MPU6050);


HAL_Delay(200);
if(xflag==1)
{
xun(openmv_x);
}

if(bluetooth_rxbuffer == 'f')
{
	flag = 1;
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}

if(bluetooth_rxbuffer == 'g')
{
	flag = 0;
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}

if(bluetooth_rxbuffer == 'u')
{
	x=1;	
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}

if(bluetooth_rxbuffer == 'o')
{
	x=2;
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}

if(bluetooth_rxbuffer == 'k')
{
	x=3;
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}

if(bluetooth_rxbuffer == 'w')
{MotorControl(MotorLeft,3500*x);
  MotorControl(MotorRight,3500*x);

	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
OLED_ShowString(2,1,&bluetooth_rxbuffer);}

else if(bluetooth_rxbuffer == 's')
{ MotorControl(MotorLeft,-3500*x);
  MotorControl(MotorRight,-3500*x);

	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
OLED_ShowString(2,1,&bluetooth_rxbuffer);}

else if(bluetooth_rxbuffer == 'd')	
{;
	__HAL_TIM_SetCompare(&htim3,TIM_CHANNEL_1,2000);
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
OLED_ShowString(2,1,&bluetooth_rxbuffer);}

else if(bluetooth_rxbuffer == 'z')
{
__HAL_TIM_SetCompare(&htim3,TIM_CHANNEL_1,1500);
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}	

else if(bluetooth_rxbuffer == 'a')	
{
	__HAL_TIM_SetCompare(&htim3,TIM_CHANNEL_1,1000);
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
OLED_ShowString(2,1,&bluetooth_rxbuffer);}

else if(bluetooth_rxbuffer == 'p')	
{MotorControl(MotorLeft,0);
  MotorControl(MotorRight,0);
	__HAL_TIM_SetCompare(&htim3,TIM_CHANNEL_1,1500);
	HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
OLED_ShowString(2,1,&bluetooth_rxbuffer);}
else if(bluetooth_rxbuffer == 'x')
{
	if (xflag==0)xflag=1;
	else xflag=0;
		HAL_UART_Receive_IT(&huart2,&bluetooth_rxbuffer,1);
}


if(flag == 1)
{
if(Distance<20)
{
	MotorControl(MotorLeft,-5000);
  MotorControl(MotorRight,-5000);
	HAL_Delay(50);
		MotorControl(MotorLeft,0);
  MotorControl(MotorRight,0);
}
}


//赋值
number1[0] = 114;//车辆编号
number1[1] = 514;//运行次数
number1[2] = 114;//控制周期
encoder[0] = SpeedL;//左编码器
encoder[1] = SpeedR;//右编码器
number2[0] = 114;//左电机控制量
number2[1] = 514;//右电机控制量
number2[2] = 114;//左电机目标
number2[3] = 514;//右电机目标
number2[4] = degree;//舵机控制量
number2[5] = openmv_x;//偏离中心量
number2[6] = 19;//左电感值
number2[7] = 19;//中电感值
number2[8] = 810;//右电感值
number2[9] = MPU6050.Ax;//加速度X
number2[10] = MPU6050.Ay;//加速度y
number2[11] = MPU6050.Az;//加速度z
number2[12] = MPU6050.Gx;//陀螺仪X
number2[13] = MPU6050.Gy;//陀螺仪y
number2[14] = MPU6050.Gz;//陀螺仪z
number2[15] = 19;//磁力计X
number2[16] = 19;//磁力计y
number2[17] = 810;//磁力计z
pid[0] = 0.1;//舵机p
pid[1] = 0.1;//舵机i
pid[2] = 0.1;//舵机d
pid[3] = 0.1;//电机p
pid[4] = 0.1;//电机i
pid[5] = 0.1;//电机d
int spd = 3500*x;//速度

printf("%s", letters);
printf("%d,",number1[0]);
printf("%d,",number1[1]);
printf("%d,",number1[2]);
printf("%d,",encoder[0]);
printf("%d,",encoder[1]);
printf("%d,",number2[0]);
printf("%d,",number2[1]);
printf("%d,",number2[2]);
printf("%d,",number2[3]);
printf("%d,",number2[4]);
printf("%d,",number2[5]);
printf("%d,",number2[6]);
printf("%d,",number2[7]);
printf("%d,",number2[8]);
printf("%d,",number2[9]);
printf("%d,",number2[10]);
printf("%d,",number2[11]);
printf("%d,",number2[12]);
printf("%d,",number2[13]);
printf("%d,",number2[14]);
printf("%d,",number2[15]);
printf("%d,",number2[16]);
printf("%d,",number2[17]);
printf("%0.1f,",pid[0]);
printf("%0.1f,",pid[1]);
printf("%0.1f,",pid[2]);
printf("%0.1f,",pid[3]);
printf("%0.1f,",pid[4]);
printf("%0.1f,",pid[5]);
printf("%d", spd);
printf("0,");
printf("0,");
printf("<");
			

	
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
			  

  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
