// FUNCTION
BOOL EQ_STATE(
  BOOL EN, 
  BOOL *__ENO, 
  IRRIGATION_STATE STATE1, 
  IRRIGATION_STATE STATE2)
{
  BOOL ENO = __BOOL_LITERAL(TRUE);
  BOOL EQ_STATE = __BOOL_LITERAL(FALSE);

  // Control execution
  if (!EN) {
    if (__ENO != NULL) {
      *__ENO = __BOOL_LITERAL(FALSE);
    }
    return EQ_STATE;
  }
  if ((STATE1 == STATE2)) {
    EQ_STATE = __BOOL_LITERAL(TRUE);
  } else {
    EQ_STATE = __BOOL_LITERAL(FALSE);
  };

  goto __end;

__end:
  if (__ENO != NULL) {
    *__ENO = ENO;
  }
  return EQ_STATE;
}


// FUNCTION
IRRIGATION_STATE SET_STATE(
  BOOL EN, 
  BOOL *__ENO, 
  IRRIGATION_STATE STATE)
{
  BOOL ENO = __BOOL_LITERAL(TRUE);
  IRRIGATION_STATE SET_STATE = IRRIGATION_STATE__STOPPED;

  // Control execution
  if (!EN) {
    if (__ENO != NULL) {
      *__ENO = __BOOL_LITERAL(FALSE);
    }
    return SET_STATE;
  }
  if (((STATE == IRRIGATION_STATE__RUNNING) || (STATE == IRRIGATION_STATE__STOPPED))) {
    SET_STATE = IRRIGATION_STATE__MANUAL;
  } else if ((STATE == IRRIGATION_STATE__MANUAL)) {
    SET_STATE = IRRIGATION_STATE__STOPPED;
  };

  goto __end;

__end:
  if (__ENO != NULL) {
    *__ENO = ENO;
  }
  return SET_STATE;
}


// FUNCTION
INT STATE_TO_NUM(
  BOOL EN, 
  BOOL *__ENO, 
  IRRIGATION_STATE STATE)
{
  BOOL ENO = __BOOL_LITERAL(TRUE);
  INT STATE_TO_NUM = 0;

  // Control execution
  if (!EN) {
    if (__ENO != NULL) {
      *__ENO = __BOOL_LITERAL(FALSE);
    }
    return STATE_TO_NUM;
  }
  if ((STATE == IRRIGATION_STATE__STOPPED)) {
    STATE_TO_NUM = 0;
  } else if ((STATE == IRRIGATION_STATE__RUNNING)) {
    STATE_TO_NUM = 1;
  } else if ((STATE == IRRIGATION_STATE__MANUAL)) {
    STATE_TO_NUM = 2;
  } else {
    STATE_TO_NUM = 3;
  };

  goto __end;

__end:
  if (__ENO != NULL) {
    *__ENO = ENO;
  }
  return STATE_TO_NUM;
}


static inline BOOL __IRRIGATION_MAIN_CONTROLLER_EQ_STATE1(BOOL EN,
  IRRIGATION_STATE STATE1,
  IRRIGATION_STATE STATE2,
  IRRIGATION_MAIN_CONTROLLER *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ_STATE9508441_ENO,);
  __res = EQ_STATE(EN,
    &__TMP_ENO,
    STATE1,
    STATE2);
  __SET_VAR(,data__->_TMP_EQ_STATE9508441_ENO,,__TMP_ENO);
  return __res;
}

static inline IRRIGATION_STATE __IRRIGATION_MAIN_CONTROLLER_SET_STATE2(BOOL EN,
  IRRIGATION_STATE STATE,
  IRRIGATION_MAIN_CONTROLLER *data__)
{
  IRRIGATION_STATE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_SET_STATE9543617_ENO,);
  __res = SET_STATE(EN,
    &__TMP_ENO,
    STATE);
  __SET_VAR(,data__->_TMP_SET_STATE9543617_ENO,,__TMP_ENO);
  return __res;
}

static inline IRRIGATION_STATE __IRRIGATION_MAIN_CONTROLLER_SET_STATE3(BOOL EN,
  IRRIGATION_STATE STATE,
  IRRIGATION_MAIN_CONTROLLER *data__)
{
  IRRIGATION_STATE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_SET_STATE5400491_ENO,);
  __res = SET_STATE(EN,
    &__TMP_ENO,
    STATE);
  __SET_VAR(,data__->_TMP_SET_STATE5400491_ENO,,__TMP_ENO);
  return __res;
}

void IRRIGATION_MAIN_CONTROLLER_init__(IRRIGATION_MAIN_CONTROLLER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->MOISTURE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->T_MAX,__time_to_timespec(1, 0, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->STATE,IRRIGATION_STATE__STOPPED,retain)
  __INIT_VAR(data__->MAN_MODE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TIMEOUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUN_VALVE,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TON0,retain);
  TOF_init__(&data__->TOF0,retain);
  __INIT_VAR(data__->_TMP_EQ_STATE9508441_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ_STATE9508441_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_SET_STATE9543617_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_SET_STATE9543617_OUT,IRRIGATION_STATE__STOPPED,retain)
  __INIT_VAR(data__->_TMP_SET_STATE5400491_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_SET_STATE5400491_OUT,IRRIGATION_STATE__STOPPED,retain)
}

// Code part
void IRRIGATION_MAIN_CONTROLLER_body__(IRRIGATION_MAIN_CONTROLLER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,_TMP_EQ_STATE9508441_OUT,,__IRRIGATION_MAIN_CONTROLLER_EQ_STATE1(
    (BOOL)__BOOL_LITERAL(TRUE),
    (IRRIGATION_STATE)__GET_VAR(data__->STATE,),
    (IRRIGATION_STATE)IRRIGATION_STATE__MANUAL,
    data__));
  if (__GET_VAR(data__->_TMP_EQ_STATE9508441_ENO,)) {
    __SET_VAR(data__->,MAN_MODE,,__GET_VAR(data__->_TMP_EQ_STATE9508441_OUT,));
  };
  __SET_VAR(data__->,RUN_VALVE,,((!(__GET_VAR(data__->TIMEOUT,)) && __GET_VAR(data__->MOISTURE,)) && !(__GET_VAR(data__->MAN_MODE,))));
  __SET_VAR(data__->TON0.,IN,,__GET_VAR(data__->RUN_VALVE,));
  __SET_VAR(data__->TON0.,PT,,__GET_VAR(data__->T_MAX,));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->TOF0.,IN,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->TOF0.,PT,,__GET_VAR(data__->T_MAX,));
  TOF_body__(&data__->TOF0);
  __SET_VAR(data__->,TIMEOUT,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->,_TMP_SET_STATE9543617_OUT,,__IRRIGATION_MAIN_CONTROLLER_SET_STATE2(
    (BOOL)(!(__GET_VAR(data__->MAN_MODE,)) && __GET_VAR(data__->RUN_VALVE,)),
    (IRRIGATION_STATE)IRRIGATION_STATE__RUNNING,
    data__));
  if (__GET_VAR(data__->_TMP_SET_STATE9543617_ENO,)) {
    __SET_VAR(data__->,STATE,,__GET_VAR(data__->_TMP_SET_STATE9543617_OUT,));
  };
  __SET_VAR(data__->,_TMP_SET_STATE5400491_OUT,,__IRRIGATION_MAIN_CONTROLLER_SET_STATE3(
    (BOOL)(!(__GET_VAR(data__->MAN_MODE,)) && !(__GET_VAR(data__->RUN_VALVE,))),
    (IRRIGATION_STATE)IRRIGATION_STATE__STOPPED,
    data__));
  if (__GET_VAR(data__->_TMP_SET_STATE5400491_ENO,)) {
    __SET_VAR(data__->,STATE,,__GET_VAR(data__->_TMP_SET_STATE5400491_OUT,));
  };

  goto __end;

__end:
  return;
} // IRRIGATION_MAIN_CONTROLLER_body__() 





void MANUAL_OVERRIDE_init__(MANUAL_OVERRIDE *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->STATE,IRRIGATION_STATE__STOPPED,retain)
  __INIT_VAR(data__->MANUAL_CONTROL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->VALVE,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void MANUAL_OVERRIDE_body__(MANUAL_OVERRIDE *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->STATE,) == IRRIGATION_STATE__MANUAL)) {
    __SET_VAR(data__->,VALVE,,__GET_VAR(data__->MANUAL_CONTROL,));
  } else if ((__GET_VAR(data__->STATE,) == IRRIGATION_STATE__STOPPED)) {
    __SET_VAR(data__->,VALVE,,__BOOL_LITERAL(FALSE));
  } else if ((__GET_VAR(data__->STATE,) == IRRIGATION_STATE__RUNNING)) {
    __SET_VAR(data__->,VALVE,,__BOOL_LITERAL(TRUE));
  };

  goto __end;

__end:
  return;
} // MANUAL_OVERRIDE_body__() 





void STATE_DISPLAY_init__(STATE_DISPLAY *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->STOPPED_LED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUNNING_LED,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MANUAL_LED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void STATE_DISPLAY_body__(STATE_DISPLAY *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  __IL_DEFVAR.INTvar = __GET_VAR(data__->STATE,);
  __IL_DEFVAR.BOOLvar = EQ_INT(__BOOL_LITERAL(TRUE), NULL, 2, __IL_DEFVAR.INTvar, 0);
  if (__IL_DEFVAR.BOOLvar) goto STATE_STOPPED;
  __IL_DEFVAR.INTvar = __GET_VAR(data__->STATE,);
  __IL_DEFVAR.BOOLvar = EQ_INT(__BOOL_LITERAL(TRUE), NULL, 2, __IL_DEFVAR.INTvar, 1);
  if (__IL_DEFVAR.BOOLvar) goto STATE_RUNNING;
  __IL_DEFVAR.INTvar = __GET_VAR(data__->STATE,);
  __IL_DEFVAR.BOOLvar = EQ_INT(__BOOL_LITERAL(TRUE), NULL, 2, __IL_DEFVAR.INTvar, 2);
  if (__IL_DEFVAR.BOOLvar) goto STATE_MANUAL;
  if (__IL_DEFVAR.BOOLvar) goto EXIT_PRG;
  STATE_STOPPED:
  ;
  __IL_DEFVAR.BOOLvar = 1;
  __SET_VAR(data__->,STOPPED_LED,,__IL_DEFVAR.BOOLvar);
  __IL_DEFVAR.BOOLvar = 0;
  __SET_VAR(data__->,MANUAL_LED,,__IL_DEFVAR.BOOLvar);
  __SET_VAR(data__->,RUNNING_LED,,__IL_DEFVAR.BOOLvar);
  goto EXIT_PRG;
  STATE_RUNNING:
  ;
  __IL_DEFVAR.BOOLvar = 1;
  __SET_VAR(data__->,RUNNING_LED,,__IL_DEFVAR.BOOLvar);
  __IL_DEFVAR.BOOLvar = 0;
  __SET_VAR(data__->,MANUAL_LED,,__IL_DEFVAR.BOOLvar);
  __SET_VAR(data__->,STOPPED_LED,,__IL_DEFVAR.BOOLvar);
  goto EXIT_PRG;
  STATE_MANUAL:
  ;
  __IL_DEFVAR.BOOLvar = 1;
  __SET_VAR(data__->,MANUAL_LED,,__IL_DEFVAR.BOOLvar);
  __IL_DEFVAR.BOOLvar = 0;
  __SET_VAR(data__->,RUNNING_LED,,__IL_DEFVAR.BOOLvar);
  __SET_VAR(data__->,STOPPED_LED,,__IL_DEFVAR.BOOLvar);
  goto EXIT_PRG;
  EXIT_PRG:
  ;

  goto __end;

__end:
  return;
} // STATE_DISPLAY_body__() 





static inline IRRIGATION_STATE __MAIN_SET_STATE1(BOOL EN,
  IRRIGATION_STATE STATE,
  MAIN *data__)
{
  IRRIGATION_STATE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_SET_STATE8504218_ENO,);
  __res = SET_STATE(EN,
    &__TMP_ENO,
    STATE);
  __SET_VAR(,data__->_TMP_SET_STATE8504218_ENO,,__TMP_ENO);
  return __res;
}

void MAIN_init__(MAIN *data__, BOOL retain) {
  IRRIGATION_MAIN_CONTROLLER_init__(&data__->IRRIGATION_MAIN_CONTROLLER0,retain);
  STATE_DISPLAY_init__(&data__->STATE_DISPLAY0,retain);
  MANUAL_OVERRIDE_init__(&data__->MANUAL_OVERRIDE0,retain);
  __INIT_VAR(data__->STATE,IRRIGATION_STATE__STOPPED,retain)
  __INIT_VAR(data__->LOW_MOISTURE_SENSOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MANUAL_VALVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->VALVE,__BOOL_LITERAL(FALSE),retain)
  R_TRIG_init__(&data__->R_TRIG0,retain);
  F_TRIG_init__(&data__->F_TRIG0,retain);
  STATE_DISPLAY_init__(&data__->STATE_DISPLAY1,retain);
  __INIT_LOCATED(BOOL,__QX0_1,data__->STOPPED_LED,retain)
  __INIT_LOCATED_VALUE(data__->STOPPED_LED,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->RUNNING_LED,retain)
  __INIT_LOCATED_VALUE(data__->RUNNING_LED,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->MANUAL_LED,retain)
  __INIT_LOCATED_VALUE(data__->MANUAL_LED,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_0,data__->SET_MANUAL,retain)
  __INIT_LOCATED_VALUE(data__->SET_MANUAL,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->_TMP_STATE_TO_NUM9679397_OUT,0,retain)
  __INIT_VAR(data__->_TMP_SET_STATE8504218_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_SET_STATE8504218_OUT,IRRIGATION_STATE__STOPPED,retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.,MOISTURE,,__GET_VAR(data__->LOW_MOISTURE_SENSOR,));
  __SET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.,T_MAX,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  __SET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.,STATE,,__GET_VAR(data__->STATE,));
  IRRIGATION_MAIN_CONTROLLER_body__(&data__->IRRIGATION_MAIN_CONTROLLER0);
  __SET_VAR(data__->,STATE,,__GET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.STATE));
  __SET_VAR(data__->,_TMP_STATE_TO_NUM9679397_OUT,,STATE_TO_NUM(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (IRRIGATION_STATE)__GET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.STATE,)));
  __SET_VAR(data__->STATE_DISPLAY1.,STATE,,__GET_VAR(data__->_TMP_STATE_TO_NUM9679397_OUT,));
  STATE_DISPLAY_body__(&data__->STATE_DISPLAY1);
  __SET_LOCATED(data__->,STOPPED_LED,,__GET_VAR(data__->STATE_DISPLAY1.STOPPED_LED,));
  __SET_LOCATED(data__->,RUNNING_LED,,__GET_VAR(data__->STATE_DISPLAY1.RUNNING_LED,));
  __SET_LOCATED(data__->,MANUAL_LED,,__GET_VAR(data__->STATE_DISPLAY1.MANUAL_LED,));
  __SET_VAR(data__->MANUAL_OVERRIDE0.,STATE,,__GET_VAR(data__->IRRIGATION_MAIN_CONTROLLER0.STATE,));
  __SET_VAR(data__->MANUAL_OVERRIDE0.,MANUAL_CONTROL,,__GET_VAR(data__->MANUAL_VALVE,));
  MANUAL_OVERRIDE_body__(&data__->MANUAL_OVERRIDE0);
  __SET_VAR(data__->,VALVE,,__GET_VAR(data__->MANUAL_OVERRIDE0.VALVE,));
  __SET_VAR(data__->R_TRIG0.,CLK,,__GET_LOCATED(data__->SET_MANUAL,));
  R_TRIG_body__(&data__->R_TRIG0);
  __SET_VAR(data__->,_TMP_SET_STATE8504218_OUT,,__MAIN_SET_STATE1(
    (BOOL)__GET_VAR(data__->R_TRIG0.Q,),
    (IRRIGATION_STATE)__GET_VAR(data__->STATE,),
    data__));
  if (__GET_VAR(data__->_TMP_SET_STATE8504218_ENO,)) {
    __SET_VAR(data__->,STATE,,__GET_VAR(data__->_TMP_SET_STATE8504218_OUT,));
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





