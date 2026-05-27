#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

// FUNCTION_BLOCK DECODER7SEG
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(INT,INPUTTAL)
  __DECLARE_VAR(BOOL,A)
  __DECLARE_VAR(BOOL,B)
  __DECLARE_VAR(BOOL,C)
  __DECLARE_VAR(BOOL,D)
  __DECLARE_VAR(BOOL,E)
  __DECLARE_VAR(BOOL,F)
  __DECLARE_VAR(BOOL,G)

  // FB private variables - TEMP, private and located variables

} DECODER7SEG;

void DECODER7SEG_init__(DECODER7SEG *data__, BOOL retain);
// Code part
void DECODER7SEG_body__(DECODER7SEG *data__);
// PROGRAM MAIN
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(INT,COUNTER)
  DECODER7SEG SEG1_DISPLAY;
  __DECLARE_VAR(INT,RESETVALUE)
  __DECLARE_VAR(INT,PRESETVALUE)
  __DECLARE_VAR(BOOL,RESETTRIGGER)
  CTU CTU1;
  TON TON0;
  __DECLARE_VAR(TIME,TON_TIMER)
  __DECLARE_VAR(BOOL,TON_TRIGGER)
  __DECLARE_VAR(BOOL,SEG1_TRIGGER)
  __DECLARE_LOCATED(BOOL,SEG_A)
  __DECLARE_LOCATED(BOOL,SEG_B)
  __DECLARE_LOCATED(BOOL,SEG_C)
  __DECLARE_LOCATED(BOOL,SEG_D)
  __DECLARE_LOCATED(BOOL,SEG_E)
  __DECLARE_LOCATED(BOOL,SEG_F)
  __DECLARE_LOCATED(BOOL,SEG_G)
  __DECLARE_LOCATED(BOOL,BTNGREEN)

} MAIN;

void MAIN_init__(MAIN *data__, BOOL retain);
// Code part
void MAIN_body__(MAIN *data__);
#endif //__POUS_H
