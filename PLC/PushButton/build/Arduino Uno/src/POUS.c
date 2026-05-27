void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->LEDGREEN,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__IX0_0,data__->BTNGREEN,retain)
  __INIT_LOCATED_VALUE(data__->BTNGREEN,__BOOL_LITERAL(FALSE))
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,LEDGREEN,,__GET_LOCATED(data__->BTNGREEN,));

  goto __end;

__end:
  return;
} // MAIN_body__() 





