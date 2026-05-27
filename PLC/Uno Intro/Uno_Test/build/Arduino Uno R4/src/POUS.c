#include "POUS.h"
#include "Config0.h"

void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->TIMERON,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TON0,retain);
  __INIT_LOCATED(BOOL,__QX0_0,data__->LEDBUILTIN,retain)
  __INIT_LOCATED_VALUE(data__->LEDBUILTIN,__BOOL_LITERAL(FALSE))
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TON0.,IN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->TON0.,PT,,__time_to_timespec(1, 1000, 0, 0, 0, 0));
  TON_body__(&data__->TON0);

  goto __end;

__end:
  return;
} // MAIN_body__() 





