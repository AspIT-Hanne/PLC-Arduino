#include "POUS.h"
#include "Config0.h"

static inline BOOL __MAIN_GT__BOOL__INT1(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  MAIN *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_GT531915_ENO,);
  __res = GT__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_GT531915_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __MAIN_EQ__BOOL__INT2(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  MAIN *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ7306377_ENO,);
  __res = EQ__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ7306377_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __MAIN_EQ__BOOL__INT3(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  MAIN *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ5673830_ENO,);
  __res = EQ__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ5673830_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __MAIN_EQ__BOOL__INT4(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  MAIN *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ3206029_ENO,);
  __res = EQ__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ3206029_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __MAIN_EQ__BOOL__INT5(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  MAIN *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ6938677_ENO,);
  __res = EQ__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ6938677_ENO,,__TMP_ENO);
  return __res;
}

void MAIN_init__(MAIN *data__, BOOL retain) {
  __INIT_VAR(data__->DEBOUNCETIME,__time_to_timespec(1, 50, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->LEDNO,0,retain)
  __INIT_VAR(data__->BTNDELAY,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TONBTNDELAY,retain);
  R_TRIG_init__(&data__->BTNTRIGGER,retain);
  __INIT_VAR(data__->TRIGGERRESET,__BOOL_LITERAL(FALSE),retain)
  CTU_init__(&data__->COUNTUPLEDNO,retain);
  __INIT_VAR(data__->LEDRED_ACTIVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LEDYELLOW_ACTIVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LEDGREEN_ACTIVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LEDBLUE_ACTIVE,__BOOL_LITERAL(FALSE),retain)
  R_TRIG_init__(&data__->R_TRIG0,retain);
  __INIT_VAR(data__->PULSERESET,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__IX0_0,data__->PUSHBTN,retain)
  __INIT_LOCATED_VALUE(data__->PUSHBTN,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_0,data__->LEDBLUE,retain)
  __INIT_LOCATED_VALUE(data__->LEDBLUE,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_1,data__->LEDGREEN,retain)
  __INIT_LOCATED_VALUE(data__->LEDGREEN,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->LEDYELLOW,retain)
  __INIT_LOCATED_VALUE(data__->LEDYELLOW,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_3,data__->LEDRED,retain)
  __INIT_LOCATED_VALUE(data__->LEDRED,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->_TMP_GT531915_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_GT531915_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ7306377_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ7306377_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ5673830_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ5673830_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ3206029_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ3206029_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ6938677_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ6938677_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->COUNTUPLEDNO.,CU,,__GET_VAR(data__->_TMP_GT531915_ENO,));
  __SET_VAR(data__->COUNTUPLEDNO.,R,,__GET_VAR(data__->TRIGGERRESET,));
  __SET_VAR(data__->COUNTUPLEDNO.,PV,,__INT_LITERAL(4));
  CTU_body__(&data__->COUNTUPLEDNO);
  __SET_VAR(data__->TONBTNDELAY.,IN,,__GET_LOCATED(data__->PUSHBTN,));
  __SET_VAR(data__->TONBTNDELAY.,PT,,__GET_VAR(data__->DEBOUNCETIME,));
  TON_body__(&data__->TONBTNDELAY);
  __SET_VAR(data__->,BTNDELAY,,__GET_VAR(data__->TONBTNDELAY.Q,));
  __SET_VAR(data__->BTNTRIGGER.,CLK,,__GET_VAR(data__->BTNDELAY,));
  R_TRIG_body__(&data__->BTNTRIGGER);
  __SET_VAR(data__->,_TMP_GT531915_OUT,,__MAIN_GT__BOOL__INT1(
    (BOOL)__GET_VAR(data__->BTNTRIGGER.Q,),
    (UINT)2,
    (INT)__GET_VAR(data__->LEDNO,),
    (INT)__INT_LITERAL(2),
    data__));
  if (__GET_VAR(data__->_TMP_GT531915_ENO,)) {
    __SET_VAR(data__->,TRIGGERRESET,,__GET_VAR(data__->_TMP_GT531915_OUT,));
  };
  __SET_VAR(data__->,LEDNO,,__GET_VAR(data__->COUNTUPLEDNO.CV,));
  __SET_VAR(data__->,_TMP_EQ7306377_OUT,,__MAIN_EQ__BOOL__INT2(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)2,
    (INT)__GET_VAR(data__->LEDNO,),
    (INT)__INT_LITERAL(0),
    data__));
  __SET_LOCATED(data__->,LEDRED,,(__GET_VAR(data__->LEDRED_ACTIVE,) && __GET_VAR(data__->_TMP_EQ7306377_ENO,)));
  if (__GET_VAR(data__->_TMP_EQ7306377_ENO,)) {
    __SET_VAR(data__->,LEDRED_ACTIVE,,__GET_VAR(data__->_TMP_EQ7306377_OUT,));
  };
  __SET_VAR(data__->,_TMP_EQ5673830_OUT,,__MAIN_EQ__BOOL__INT3(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)2,
    (INT)__GET_VAR(data__->LEDNO,),
    (INT)__INT_LITERAL(1),
    data__));
  __SET_LOCATED(data__->,LEDYELLOW,,(__GET_VAR(data__->LEDYELLOW_ACTIVE,) && __GET_VAR(data__->_TMP_EQ5673830_ENO,)));
  if (__GET_VAR(data__->_TMP_EQ5673830_ENO,)) {
    __SET_VAR(data__->,LEDYELLOW_ACTIVE,,__GET_VAR(data__->_TMP_EQ5673830_OUT,));
  };
  __SET_VAR(data__->,_TMP_EQ3206029_OUT,,__MAIN_EQ__BOOL__INT4(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)2,
    (INT)__GET_VAR(data__->LEDNO,),
    (INT)__INT_LITERAL(2),
    data__));
  __SET_LOCATED(data__->,LEDGREEN,,(__GET_VAR(data__->LEDGREEN_ACTIVE,) && __GET_VAR(data__->_TMP_EQ3206029_ENO,)));
  if (__GET_VAR(data__->_TMP_EQ3206029_ENO,)) {
    __SET_VAR(data__->,LEDGREEN_ACTIVE,,__GET_VAR(data__->_TMP_EQ3206029_OUT,));
  };
  __SET_VAR(data__->,_TMP_EQ6938677_OUT,,__MAIN_EQ__BOOL__INT5(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)2,
    (INT)__GET_VAR(data__->LEDNO,),
    (INT)__INT_LITERAL(3),
    data__));
  __SET_LOCATED(data__->,LEDBLUE,,(__GET_VAR(data__->LEDBLUE_ACTIVE,) && __GET_VAR(data__->_TMP_EQ6938677_ENO,)));
  if (__GET_VAR(data__->_TMP_EQ6938677_ENO,)) {
    __SET_VAR(data__->,LEDBLUE_ACTIVE,,__GET_VAR(data__->_TMP_EQ6938677_OUT,));
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





