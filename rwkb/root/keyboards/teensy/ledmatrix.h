#include <avr/io.h>

void ledMatrixLayerChangeHook(uint32_t state);
void ledMatrixInit(void);
void ledMatrixDraw(void);
void ledMatrixSetKeyState(uint8_t row, uint8_t col, uint8_t value);
void ledMatrixSetRowState(uint8_t row, uint8_t value[]);
void ledMatrixSetState(uint8_t value[]);
void ledMatrixToggle(void);
void ledMatrixSetOn(uint8_t on);
