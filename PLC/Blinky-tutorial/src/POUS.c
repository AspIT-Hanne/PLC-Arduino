void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__IX0_0,data__->INPUT_SWITCH,retain)
  __INIT_LOCATED_VALUE(data__->INPUT_SWITCH,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->OUTPUT_INDICATOR,retain)
  __INIT_LOCATED_VALUE(data__->OUTPUT_INDICATOR,__BOOL_LITERAL(FALSE))
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_LOCATED(data__->,OUTPUT_INDICATOR,,!(__GET_LOCATED(data__->INPUT_SWITCH,)));

  goto __end;

__end:
  return;
} // MAIN_body__() 





