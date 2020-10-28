#include <avr/io.h>
#include "ledmatrix-config.h"
#include "ledmatrix.h"

//remeber to update size  and change hook when adding layers
static uint8_t layerLED[5][LED_MAT_ROWSIZE * LED_MAT_COLSIZE] = {
    {//0 - default layer 
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND
    },
    {//1 - numbers 
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_RED, _RED,_RED,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_RED, _RED,_RED,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_RED, _RED,_RED,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_RED, _IND,_IND,_IND,_IND
    },
    {//2 - special and nav
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_RED,_RED, _RED,_RED,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND
    },
    {//3 - mouse and media layer 
        _IND,_IND,_RED,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_RED,
        _IND,_RED,_RED,_RED, _IND,_RED,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_RED,_IND,_IND, _IND,_IND,_IND,_IND, _RED,_RED,_RED,_RED
    },
    {//4 - game mode
        _IND,_IND,_RED,_IND, _IND,_IND,_IND,_RED, _RED,_RED,_RED,_RED,
        _IND,_RED,_RED,_RED, _IND,_IND,_IND,_RED, _RED,_RED,_RED,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND,
        _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND, _IND,_IND,_IND,_IND
    }
};

//state is a 32bit int representing current active layers
void ledMatrixLayerChangeHook(uint8_t level){
    ledMatrixSetState(layerLED[level]);
}

