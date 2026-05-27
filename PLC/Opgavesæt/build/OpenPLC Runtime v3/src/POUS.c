void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__IX0_0,data__->S1,retain)
  __INIT_LOCATED_VALUE(data__->S1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->S2,retain)
  __INIT_LOCATED_VALUE(data__->S2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->H1,retain)
  __INIT_LOCATED_VALUE(data__->H1,__BOOL_LITERAL(FALSE))
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_LOCATED(data__->,H1,,(__GET_LOCATED(data__->S2,) && __GET_LOCATED(data__->S1,)));

  goto __end;

__end:
  return;
} // MAIN_body__() 





