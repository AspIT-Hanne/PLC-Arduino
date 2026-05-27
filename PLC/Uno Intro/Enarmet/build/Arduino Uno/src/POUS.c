void DECODER7SEG_init__(DECODER7SEG *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->INPUTTAL,0,retain)
  __INIT_VAR(data__->A,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->B,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->C,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->D,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->E,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->F,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->G,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void DECODER7SEG_body__(DECODER7SEG *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  {
    INT __case_expression = __GET_VAR(data__->INPUTTAL,);
    if ((__case_expression == 0) ||
             (__case_expression == 10)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,1);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,0);
    }
    else if ((__case_expression == 1)) {
      __SET_VAR(data__->,A,,0);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,0);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,0);
      __SET_VAR(data__->,G,,0);
    }
    else if ((__case_expression == 2)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,0);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,1);
      __SET_VAR(data__->,F,,0);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 3)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,0);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 4)) {
      __SET_VAR(data__->,A,,0);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,0);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 5)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,0);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 6)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,0);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,1);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 7)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,0);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,0);
      __SET_VAR(data__->,G,,0);
    }
    else if ((__case_expression == 8)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,1);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,1);
    }
    else if ((__case_expression == 9)) {
      __SET_VAR(data__->,A,,1);
      __SET_VAR(data__->,B,,1);
      __SET_VAR(data__->,C,,1);
      __SET_VAR(data__->,D,,1);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,1);
      __SET_VAR(data__->,G,,1);
    }
    else {
      __SET_VAR(data__->,A,,0);
      __SET_VAR(data__->,B,,0);
      __SET_VAR(data__->,C,,0);
      __SET_VAR(data__->,D,,0);
      __SET_VAR(data__->,E,,0);
      __SET_VAR(data__->,F,,0);
      __SET_VAR(data__->,G,,0);
    }
  };

  goto __end;

__end:
  return;
} // DECODER7SEG_body__() 





void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->COUNTER,0,retain)
  DECODER7SEG_init__(&data__->SEG1_DISPLAY,retain);
  __INIT_VAR(data__->RESETVALUE,9,retain)
  __INIT_VAR(data__->PRESETVALUE,10,retain)
  __INIT_VAR(data__->RESETTRIGGER,__BOOL_LITERAL(FALSE),retain)
  CTU_init__(&data__->CTU1,retain);
  TON_init__(&data__->TON0,retain);
  __INIT_VAR(data__->TON_TIMER,__time_to_timespec(1, 30, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TON_TRIGGER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEG1_TRIGGER,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__QX0_0,data__->SEG_A,retain)
  __INIT_LOCATED_VALUE(data__->SEG_A,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_1,data__->SEG_B,retain)
  __INIT_LOCATED_VALUE(data__->SEG_B,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->SEG_C,retain)
  __INIT_LOCATED_VALUE(data__->SEG_C,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_3,data__->SEG_D,retain)
  __INIT_LOCATED_VALUE(data__->SEG_D,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_4,data__->SEG_E,retain)
  __INIT_LOCATED_VALUE(data__->SEG_E,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_5,data__->SEG_F,retain)
  __INIT_LOCATED_VALUE(data__->SEG_F,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_6,data__->SEG_G,retain)
  __INIT_LOCATED_VALUE(data__->SEG_G,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_0,data__->BTNGREEN,retain)
  __INIT_LOCATED_VALUE(data__->BTNGREEN,__BOOL_LITERAL(FALSE))
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,SEG1_TRIGGER,,__GET_LOCATED(data__->BTNGREEN,));
  __SET_VAR(data__->TON0.,IN,,(!(__GET_VAR(data__->TON_TRIGGER,)) && __GET_VAR(data__->SEG1_TRIGGER,)));
  __SET_VAR(data__->TON0.,PT,,__GET_VAR(data__->TON_TIMER,));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->CTU1.,CU,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->CTU1.,R,,__GET_VAR(data__->RESETTRIGGER,));
  __SET_VAR(data__->CTU1.,PV,,__GET_VAR(data__->PRESETVALUE,));
  CTU_body__(&data__->CTU1);
  __SET_VAR(data__->,TON_TRIGGER,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->,RESETTRIGGER,,__GET_VAR(data__->CTU1.Q,));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->CTU1.CV,));
  __SET_VAR(data__->SEG1_DISPLAY.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->SEG1_DISPLAY.,INPUTTAL,,__GET_VAR(data__->COUNTER,));
  DECODER7SEG_body__(&data__->SEG1_DISPLAY);
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_A,,__GET_VAR(data__->SEG1_DISPLAY.A,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_B,,__GET_VAR(data__->SEG1_DISPLAY.B,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_C,,__GET_VAR(data__->SEG1_DISPLAY.C,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_D,,__GET_VAR(data__->SEG1_DISPLAY.D,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_E,,__GET_VAR(data__->SEG1_DISPLAY.E,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_F,,__GET_VAR(data__->SEG1_DISPLAY.F,));
  };
  if (__GET_VAR(data__->SEG1_DISPLAY.ENO,)) {
    __SET_LOCATED(data__->,SEG_G,,__GET_VAR(data__->SEG1_DISPLAY.G,));
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





