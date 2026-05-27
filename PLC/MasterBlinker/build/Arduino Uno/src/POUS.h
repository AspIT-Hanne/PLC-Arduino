#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// PROGRAM MAIN
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  TON TIMER_PAUSE;
  TON TIMER_LYS;
  __DECLARE_VAR(BOOL,TIMERLYSON)
  __DECLARE_VAR(TIME,PRESETTIME)
  __DECLARE_VAR(TIME,PRESETTIME1)
  __DECLARE_VAR(BOOL,REDLED)

} MAIN;

void MAIN_init__(MAIN *data__, BOOL retain);
// Code part
void MAIN_body__(MAIN *data__);
#endif //__POUS_H
