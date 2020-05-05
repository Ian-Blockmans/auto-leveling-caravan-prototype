/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef struct accel {
	int8_t x;
	int8_t y;
	int8_t z;
} acc;

typedef enum error {
	OK = 0, TIMEOUT = 1,
} err;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim14;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_TIM3_Init(void);
static void MX_I2C1_Init(void);
static void MX_TIM14_Init(void);
/* USER CODE BEGIN PFP */
acc readacc();
err legstoground();
void c_back_right(uint8_t dir, uint8_t duty, uint8_t onoff);
void c_back_left(uint8_t dir, uint8_t duty, uint8_t onoff);
void c_front_right(uint8_t dir, uint8_t duty, uint8_t onoff);
void c_front_left(uint8_t dir, uint8_t duty, uint8_t onoff);
err fronttoback();
uint8_t lefttoright();

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

uint8_t timeout = 0;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	if (htim->Instance == htim14.Instance) {
		timeout = 1;
	}
}

acc readacc() {
	acc axis;
	uint8_t i2cbuffer[8];
	HAL_StatusTypeDef ok;
	//i2cbuffer[0] = 0x28;
	//HAL_I2C_Master_Transmit(&hi2c1,0b0011001<<1,i2cbuffer,1,500);//ask
	//HAL_I2C_Master_Receive(&hi2c1,0b00110011,i2cbuffer,6,500);//get
	ok = HAL_I2C_Mem_Read(&hi2c1, 0b00110010, 0x29, 1, &i2cbuffer[0], 1, 500);
	ok = HAL_I2C_Mem_Read(&hi2c1, 0b00110010, 0x2b, 1, &i2cbuffer[1], 1, 500);
	ok = HAL_I2C_Mem_Read(&hi2c1, 0b00110010, 0x2d, 1, &i2cbuffer[2], 1, 500);
	//HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13);
	axis.x = i2cbuffer[0];
	axis.y = i2cbuffer[1];
	axis.z = i2cbuffer[2];
	return axis;
}

err legstoground() {
	acc pos;
	acc init_pos;
	uint8_t kantel_count = 0;
	init_pos = readacc();
	pos = readacc();
	HAL_Delay(1000);
	if (init_pos.y > -3) {
		//start front motors
		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y - 2 < pos.y) {
			c_front_left(1, 80, 1);
			HAL_Delay(500);
			c_front_left(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_front_left(0, 80, 1);
		HAL_Delay(500);
		c_front_left(0, 80, 0);
		HAL_Delay(1000);

		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y - 2 < pos.y) {
			c_front_right(1, 80, 1);
			HAL_Delay(500);
			c_front_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			////wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_front_right(0, 80, 1);
		HAL_Delay(500);
		c_front_right(0, 80, 0);

		//kantel
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (pos.y > -10) {
			c_front_left(1, 80, 1);
			c_front_right(1, 80, 1);
			HAL_Delay(500);
			c_front_left(1, 80, 0);
			c_front_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			kantel_count++;
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_front_left(0, 80, 1);
		c_front_right(0, 80, 1);
		HAL_Delay(500);
		c_front_left(0, 80, 0);
		c_front_right(0, 80, 0);
		HAL_Delay(2000);

		//start back
		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y + 2 > pos.y) {
			c_back_left(1, 80, 1);
			HAL_Delay(500);
			c_back_left(1, 80, 0);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_back_left(0, 80, 1);
		HAL_Delay(500);
		c_back_left(0, 80, 0);

		HAL_Delay(1000);
		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y + 2 > pos.y && init_pos.x + 2 > pos.x) {
			c_back_right(1, 80, 1);
			HAL_Delay(500);
			c_back_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_back_right(0, 80, 1);
		HAL_Delay(500);
		c_back_right(0, 80, 0);
	} else {
		//start back
		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y + 2 > pos.y) {
			c_back_left(1, 80, 1);
			HAL_Delay(500);
			c_back_left(1, 80, 0);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_back_left(0, 80, 1);
		HAL_Delay(500);
		c_back_left(0, 80, 0);

		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y + 2 > pos.y) {
			c_back_right(1, 80, 1);
			HAL_Delay(500);
			c_back_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			////wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_back_right(0, 80, 1);
		HAL_Delay(500);
		c_back_right(0, 80, 0);

		//kantel
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (pos.y < 0) {
			c_back_left(1, 80, 1);
			c_back_right(1, 80, 1);
			HAL_Delay(500);
			c_back_left(1, 80, 0);
			c_back_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_back_left(0, 80, 1);
		c_back_right(0, 80, 1);
		HAL_Delay(1000);
		c_back_left(0, 80, 0);
		c_back_right(0, 80, 0);
		HAL_Delay(2000);

		//start front
		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y - 2 < pos.y) {
			c_front_left(1, 80, 1);
			HAL_Delay(500);
			c_front_left(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_front_left(0, 80, 1);
		HAL_Delay(500);
		c_front_left(0, 80, 0);

		init_pos = readacc();
		pos = readacc();
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.y - 2 < pos.y || init_pos.x + 2 < pos.x) {
			c_front_right(1, 80, 1);
			HAL_Delay(500);
			c_front_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			//wacht tot de grond is geraakt
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
		c_front_right(0, 80, 1);
		HAL_Delay(500);
		c_front_right(0, 80, 0);

	}
	return 0;
}

void legsup() {
	c_back_right(0, 80, 1);
	c_back_left(0, 80, 1);
	c_front_right(0, 80, 1);
	c_front_left(0, 80, 1);
	HAL_Delay(20000);
	c_back_right(0, 80, 0);
	c_back_left(0, 80, 0);
	c_front_right(0, 80, 0);
	c_front_left(0, 80, 0);
}

err fronttoback() {
	acc pos;

//front fix

	pos = readacc();
	HAL_TIM_Base_Start_IT(&htim14);
	while (pos.y < -7 || pos.y > -5) {
		if (pos.y < -6) {
			c_back_left(1, 80, 1);
			c_back_right(1, 80, 1);
			HAL_Delay(200);
			c_back_left(1, 80, 0);
			c_back_right(1, 80, 0);
			HAL_Delay(2000);
			pos = readacc();
			HAL_Delay(1000);
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		} else {
			c_front_left(1, 80, 1);
			c_front_right(1, 80, 1);
			HAL_Delay(200);
			c_front_left(1, 80, 0);
			c_front_right(1, 80, 0);
			HAL_Delay(2000);
			pos = readacc();
			HAL_Delay(1000);
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}

		}
	}
	HAL_TIM_Base_Stop_IT(&htim14);
	TIM14->CNT = 0;
	return OK;
}

uint8_t lefttoright() {
	acc pos;
	uint8_t last_up = 0; //1 = right | 2 = left
//front fix
	pos = readacc();
	HAL_TIM_Base_Start_IT(&htim14);
	while (pos.x < -3 || pos.x > 0) {
		if (pos.x < -1) {
			c_front_right(1, 80, 1);
			c_back_right(1, 80, 1);
			HAL_Delay(200);
			c_front_right(1, 80, 0);
			c_back_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			last_up = 1;
		} else {
			c_front_left(1, 80, 1);
			c_back_left(1, 80, 1);
			HAL_Delay(500);
			c_front_left(1, 80, 0);
			c_back_left(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			last_up = 2;
		}
		if (timeout == 1) {
			HAL_TIM_Base_Stop_IT(&htim14);
			TIM14->CNT = 0;
			timeout = 0;
			return 0;
		}
	}
	HAL_TIM_Base_Stop_IT(&htim14);
	TIM14->CNT = 0;
	return last_up;
}

err legs_down_last(uint8_t leg_fix) {
	acc pos, init_pos;
	init_pos = readacc();
	pos = readacc();
	if (leg_fix == 1) {
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.x - 2 < pos.x) {
			c_front_left(1, 80, 1);
			c_back_left(1, 80, 1);
			HAL_Delay(500);
			c_front_left(1, 80, 0);
			c_back_left(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
	} else if (leg_fix == 2) {
		HAL_TIM_Base_Start_IT(&htim14);
		while (init_pos.x + 2 > pos.x) {
			c_front_right(1, 80, 1);
			c_back_right(1, 80, 1);
			HAL_Delay(500);
			c_front_right(1, 80, 0);
			c_back_right(1, 80, 0);
			HAL_Delay(1000);
			pos = readacc();
			HAL_Delay(1000);
			if (timeout == 1) {
				HAL_TIM_Base_Stop_IT(&htim14);
				TIM14->CNT = 0;
				timeout = 0;
				return TIMEOUT;
			}
		}
		HAL_TIM_Base_Stop_IT(&htim14);
		TIM14->CNT = 0;
	} else {
	}
	return OK;
}

void c_back_right(uint8_t dir, uint8_t duty, uint8_t onoff) {
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, dir);
	if (onoff == 1) {
		HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
	} else {
		HAL_TIM_PWM_Stop(&htim3, TIM_CHANNEL_3);
	}
}

void c_front_right(uint8_t dir, uint8_t duty, uint8_t onoff) {
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, dir);
	if (onoff == 1) {
		HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
	} else {
		HAL_TIM_PWM_Stop(&htim3, TIM_CHANNEL_1);
	}
}

void c_front_left(uint8_t dir, uint8_t duty, uint8_t onoff) {
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5, dir);
	if (onoff == 1) {
		HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2);
	} else {
		HAL_TIM_PWM_Stop(&htim3, TIM_CHANNEL_2);
	}
}

void c_back_left(uint8_t dir, uint8_t duty, uint8_t onoff) {
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, dir);
	if (onoff == 1) {
		HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4);
	} else {
		HAL_TIM_PWM_Stop(&htim3, TIM_CHANNEL_4);
	}
}

uint8_t debounce100(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin) {
	uint8_t counter = 0, timeout = 0, last_state = 0;
	HAL_Delay(1);
	if (HAL_GPIO_ReadPin(GPIOx, GPIO_Pin) == 0) {
		while (counter < 100) {
			timeout++;
			if (HAL_GPIO_ReadPin(GPIOx, GPIO_Pin) == last_state) {
				counter++;
			} else {
				counter = 0;
			}
			last_state = HAL_GPIO_ReadPin(GPIOx, GPIO_Pin);
			if (timeout == 500) {
				break;
			}
		}
		if (counter == 100) {
			return 1;
		} else {
			return 0;
		}
	} else {
		return 0;
	}
}

/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {
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
	MX_TIM3_Init();
	MX_I2C1_Init();
	MX_TIM14_Init();
	/* USER CODE BEGIN 2 */
	uint8_t buffer[8];
	uint8_t leg_fix;
	err status_legs;

	buffer[0] = 0x20;
	buffer[1] = 0b01000111;
	HAL_StatusTypeDef status;
	status = HAL_I2C_Master_Transmit(&hi2c1, 0b0011001 << 1, buffer, 2, 500);
	if (status != HAL_OK) {
		while (1)
			;
		//status = HAL_I2C_Master_Transmit(&hi2c1,0b0011000<<1,buffer,2,500);
	}	// config acc
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, 0);
	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
		if (debounce100(GPIOA, GPIO_PIN_4)) {
			status_legs = legstoground();
			if (status_legs == OK) {
				status_legs = fronttoback();
				if (status_legs == OK) {
					leg_fix = lefttoright();
					if (leg_fix > 0) {
						legs_down_last(leg_fix);
						fronttoback();
						lefttoright();
					} else {
						legsup();
					}
				} else {
					legsup();
				}
			} else {
				legsup();
			}
		}
		if (debounce100(GPIOA, GPIO_PIN_5)) {
			legsup();
		}

	}
	/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };
	RCC_PeriphCLKInitTypeDef PeriphClkInit = { 0 };

	/** Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}
	/** Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK) {
		Error_Handler();
	}
	PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_I2C1;
	PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_HSI;
	if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK) {
		Error_Handler();
	}
}

/**
 * @brief I2C1 Initialization Function
 * @param None
 * @retval None
 */
static void MX_I2C1_Init(void) {

	/* USER CODE BEGIN I2C1_Init 0 */

	/* USER CODE END I2C1_Init 0 */

	/* USER CODE BEGIN I2C1_Init 1 */

	/* USER CODE END I2C1_Init 1 */
	hi2c1.Instance = I2C1;
	hi2c1.Init.Timing = 0x2000090E;
	hi2c1.Init.OwnAddress1 = 0;
	hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
	hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
	hi2c1.Init.OwnAddress2 = 0;
	hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
	hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
	hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
	if (HAL_I2C_Init(&hi2c1) != HAL_OK) {
		Error_Handler();
	}
	/** Configure Analogue filter
	 */
	if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE)
			!= HAL_OK) {
		Error_Handler();
	}
	/** Configure Digital filter
	 */
	if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK) {
		Error_Handler();
	}
	/* USER CODE BEGIN I2C1_Init 2 */

	/* USER CODE END I2C1_Init 2 */

}

/**
 * @brief TIM3 Initialization Function
 * @param None
 * @retval None
 */
static void MX_TIM3_Init(void) {

	/* USER CODE BEGIN TIM3_Init 0 */

	/* USER CODE END TIM3_Init 0 */

	TIM_ClockConfigTypeDef sClockSourceConfig = { 0 };
	TIM_MasterConfigTypeDef sMasterConfig = { 0 };
	TIM_OC_InitTypeDef sConfigOC = { 0 };

	/* USER CODE BEGIN TIM3_Init 1 */

	/* USER CODE END TIM3_Init 1 */
	htim3.Instance = TIM3;
	htim3.Init.Prescaler = 80;
	htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim3.Init.Period = 100;
	htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	if (HAL_TIM_Base_Init(&htim3) != HAL_OK) {
		Error_Handler();
	}
	sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
	if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK) {
		Error_Handler();
	}
	if (HAL_TIM_PWM_Init(&htim3) != HAL_OK) {
		Error_Handler();
	}
	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig)
			!= HAL_OK) {
		Error_Handler();
	}
	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 1;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_LOW;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1)
			!= HAL_OK) {
		Error_Handler();
	}
	if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2)
			!= HAL_OK) {
		Error_Handler();
	}
	if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3)
			!= HAL_OK) {
		Error_Handler();
	}
	if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_4)
			!= HAL_OK) {
		Error_Handler();
	}
	/* USER CODE BEGIN TIM3_Init 2 */

	/* USER CODE END TIM3_Init 2 */
	HAL_TIM_MspPostInit(&htim3);

}

/**
 * @brief TIM14 Initialization Function
 * @param None
 * @retval None
 */
static void MX_TIM14_Init(void) {

	/* USER CODE BEGIN TIM14_Init 0 */

	/* USER CODE END TIM14_Init 0 */

	/* USER CODE BEGIN TIM14_Init 1 */

	/* USER CODE END TIM14_Init 1 */
	htim14.Instance = TIM14;
	htim14.Init.Prescaler = 25000;
	htim14.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim14.Init.Period = 25600;
	htim14.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim14.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	if (HAL_TIM_Base_Init(&htim14) != HAL_OK) {
		Error_Handler();
	}
	/* USER CODE BEGIN TIM14_Init 2 */

	/* USER CODE END TIM14_Init 2 */

}

/**
 * @brief GPIO Initialization Function
 * @param None
 * @retval None
 */
static void MX_GPIO_Init(void) {
	GPIO_InitTypeDef GPIO_InitStruct = { 0 };

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOA_CLK_ENABLE()
	;
	__HAL_RCC_GPIOB_CLK_ENABLE()
	;

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOA, LED_Pin | GPIO_PIN_15, GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5,
			GPIO_PIN_RESET);

	/*Configure GPIO pins : STOP1_Pin STOP2_Pin STOP3_Pin STOP4_Pin
	 Extend_Pin Retract_Pin INT2_Pin INT2A12_Pin */
	GPIO_InitStruct.Pin = STOP1_Pin | STOP2_Pin | STOP3_Pin | STOP4_Pin
			| Extend_Pin | Retract_Pin | INT2_Pin | INT2A12_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pins : LED_Pin PA15 */
	GPIO_InitStruct.Pin = LED_Pin | GPIO_PIN_15;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pins : PB3 PB4 PB5 */
	GPIO_InitStruct.Pin = GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */

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
	 tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	/* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
