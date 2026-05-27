void MAIN_init__(MAIN *data__, BOOL retain) {
  TON_init__(&data__->TIMER_PAUSE,retain);
  TON_init__(&data__->TIMER_LYS,retain);
  __INIT_VAR(data__->TIMERLYSON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PRESETTIME,__time_to_timespec(1, 600, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->PRESETTIME1,__time_to_timespec(1, 300, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->REDLED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TIMER_PAUSE.,IN,,!(__GET_VAR(data__->TIMERLYSON,)));
  __SET_VAR(data__->TIMER_PAUSE.,PT,,__GET_VAR(data__->PRESETTIME,));
  TON_body__(&data__->TIMER_PAUSE);
  __SET_VAR(data__->,TIMERLYSON,,__GET_VAR(data__->TIMER_PAUSE.Q,));
  __SET_VAR(data__->,REDLED,,__GET_VAR(data__->TIMERLYSON,));

  goto __end;

__end:
  return;
} // MAIN_body__() 





