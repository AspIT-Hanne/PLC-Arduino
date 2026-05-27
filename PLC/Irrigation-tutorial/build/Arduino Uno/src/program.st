TYPE
  irrigation_State : (Stopped, Running, Manual);
END_TYPE

FUNCTION eq_State : BOOL
  VAR_INPUT
    State1 : irrigation_State;
    State2 : irrigation_State;
  END_VAR

  if State1 = State2 then
      eq_State := true;
  else
      eq_State := false;
  end_if;
END_FUNCTION

FUNCTION set_State : irrigation_State
  VAR_INPUT
    State : irrigation_State;
  END_VAR

  set_State := State;
END_FUNCTION

FUNCTION state_To_Num : INT
  VAR_INPUT
    State : irrigation_State;
  END_VAR

  if State = Stopped then
      state_To_Num := 0;
  elsif State = Running then
      state_To_Num := 1;
  elsif State = Manual then
      state_To_Num := 2;
  else
      state_To_Num := 3;
  end_if;
END_FUNCTION

FUNCTION_BLOCK irrigation_Main_Controller
  VAR_INPUT
    Moisture : BOOL;
    T_Max : TIME;
  END_VAR
  VAR_IN_OUT
    State : irrigation_State;
  END_VAR
  VAR
    man_mode : BOOL;
    timeout : BOOL;
    run_valve : BOOL;
    TON0 : TON;
    TOF0 : TOF;
    _TMP_eq_State9508441_ENO : BOOL;
    _TMP_eq_State9508441_OUT : BOOL;
    _TMP_set_State9543617_ENO : BOOL;
    _TMP_set_State9543617_OUT : irrigation_State;
    _TMP_set_State5400491_ENO : BOOL;
    _TMP_set_State5400491_OUT : irrigation_State;
  END_VAR

  _TMP_eq_State9508441_OUT := eq_State(EN := TRUE, State1 := State, State2 := Manual, ENO => _TMP_eq_State9508441_ENO);
  IF _TMP_eq_State9508441_ENO THEN
      man_mode := _TMP_eq_State9508441_OUT;
  END_IF;
  run_valve := NOT(timeout) AND Moisture AND NOT(man_mode);
  TON0(IN := run_valve, PT := T_Max);
  TOF0(IN := TON0.Q, PT := T_Max);
  timeout := TOF0.Q;
  _TMP_set_State9543617_OUT := set_State(EN := NOT(man_mode) AND run_valve, State := Running, ENO => _TMP_set_State9543617_ENO);
  IF _TMP_set_State9543617_ENO THEN
      State := _TMP_set_State9543617_OUT;
  END_IF;
  _TMP_set_State5400491_OUT := set_State(EN := NOT(man_mode) AND NOT(run_valve), State := Stopped, ENO => _TMP_set_State5400491_ENO);
  IF _TMP_set_State5400491_ENO THEN
      State := _TMP_set_State5400491_OUT;
  END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK manual_Override
  VAR_INPUT
    State : irrigation_State;
    Manual_control : BOOL;
  END_VAR
  VAR_OUTPUT
    Valve : BOOL;
  END_VAR

  if State = Manual then  
      Valve := Manual_control;
  elsif State = Stopped then
      Valve := false;
  elsif State = Running then
      Valve := true;
  end_if;
END_FUNCTION_BLOCK

FUNCTION_BLOCK state_Display
  VAR_INPUT
    State : INT;
  END_VAR
  VAR_OUTPUT
    Stopped_led : BOOL;
    Running_led : BOOL;
    Manual_led : BOOL;
  END_VAR

  (* Determine State *)
  LD State
  EQ 0
  JMPC state_stopped

  LD State
  EQ 1
  JMPC state_running

  LD State
  EQ 2
  JMPC state_manual

  JMPC exit_prg


  state_stopped:
  LD 1
  ST Stopped_led
  LD 0
  ST Manual_led
  ST Running_led
  JMP exit_prg

  state_running:
  LD 1
  ST Running_led
  LD 0
  ST Manual_led
  ST Stopped_led
  JMP exit_prg

  state_manual:
  LD 1
  ST Manual_led
  LD 0
  ST Running_led
  ST Stopped_led
  JMP exit_prg

  exit_prg:
END_FUNCTION_BLOCK

PROGRAM main
  VAR
    IRRIGATION_MAIN_CONTROLLER0 : irrigation_Main_Controller;
    STATE_DISPLAY0 : state_Display;
    MANUAL_OVERRIDE0 : manual_Override;
    State : IRRIGATION_STATE;
    Low_Moisture_Sensor : BOOL;
    Manual_valve : BOOL;
    Valve : BOOL;
    R_TRIG0 : R_TRIG;
    F_TRIG0 : F_TRIG;
    STATE_DISPLAY1 : state_Display;
  END_VAR
  VAR
    Stopped_led AT %QX0.1 : BOOL;
    Running_led AT %QX0.0 : BOOL;
    Manual_led AT %QX0.2 : BOOL;
    Set_manual AT %IX0.0 : BOOL;
  END_VAR
  VAR
    _TMP_state_To_Num9679397_OUT : INT;
    _TMP_set_State8504218_ENO : BOOL;
    _TMP_set_State8504218_OUT : irrigation_State;
    _TMP_set_State8542285_ENO : BOOL;
    _TMP_set_State8542285_OUT : irrigation_State;
  END_VAR

  IRRIGATION_MAIN_CONTROLLER0(State := State, Moisture := Low_Moisture_Sensor, T_Max := T#5s);
  _TMP_state_To_Num9679397_OUT := state_To_Num(IRRIGATION_MAIN_CONTROLLER0.State);
  STATE_DISPLAY1(State := _TMP_state_To_Num9679397_OUT);
  Stopped_led := STATE_DISPLAY1.Stopped_led;
  Running_led := STATE_DISPLAY1.Running_led;
  Manual_led := STATE_DISPLAY1.Manual_led;
  MANUAL_OVERRIDE0(State := IRRIGATION_MAIN_CONTROLLER0.State, Manual_control := Manual_valve);
  Valve := MANUAL_OVERRIDE0.Valve;
  R_TRIG0(CLK := Set_manual);
  _TMP_set_State8504218_OUT := set_State(EN := R_TRIG0.Q, State := Manual, ENO => _TMP_set_State8504218_ENO);
  F_TRIG0(CLK := Set_manual);
  _TMP_set_State8542285_OUT := set_State(EN := F_TRIG0.Q, State := Stopped, ENO => _TMP_set_State8542285_ENO);
  IF _TMP_set_State8504218_ENO THEN
      State := _TMP_set_State8504218_OUT;
  END_IF;
  IF _TMP_set_State8542285_ENO THEN
      State := _TMP_set_State8542285_OUT;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "589b2a69a2320cf26758909dc5ef32e5";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:char plc_program_md5[] = "589b2a69a2320cf26758909dc5ef32e5";*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern MAIN RES0__INSTANCE0;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.MOISTURE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.T_MAX), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.MAN_MODE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TIMEOUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.RUN_VALVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_EQ_STATE9508441_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_EQ_STATE9508441_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_SET_STATE9543617_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_SET_STATE5400491_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.STATE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.STOPPED_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.RUNNING_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY0.MANUAL_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.MANUAL_CONTROL), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.VALVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LOW_MOISTURE_SENSOR), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_VALVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.VALVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG0.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG0.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.STATE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.STOPPED_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.RUNNING_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STATE_DISPLAY1.MANUAL_LED), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STOPPED_LED), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RUNNING_LED), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_LED), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MANUAL), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_STATE_TO_NUM9679397_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_SET_STATE8504218_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_SET_STATE8542285_ENO), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               67*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return sizeof(SINT);*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return sizeof(TIME);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_BOOL_p *) ptr)->flags & __IEC_FORCE_FLAG)*)
(*DBG:                        ? &(((__IEC_BOOL_p *) ptr)->fvalue)*)
(*DBG:                        : ((__IEC_BOOL_p *) ptr)->value);*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return (void *)&((__IEC_SINT_t *) ptr)->value;*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return (void *)&((__IEC_TIME_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case BOOL_O_ENUM: {*)
(*DBG:            memcpy((((__IEC_BOOL_p *) ptr)->value), val, var_size);*)
(*DBG:            memcpy(&((__IEC_BOOL_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BOOL_P_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case SINT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case TIME_ENUM: {*)
(*DBG:            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_O_ENUM:*)
(*DBG:        case BOOL_P_ENUM:*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case SINT_ENUM:*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case TIME_ENUM:*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size)*)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i)*)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++)*)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Prevent swapping for STRING type*)
(*DBG:            if (debug_vars[idx].type == STRING_ENUM)*)
(*DBG:            {*)
(*DBG:                // Do nothing*)
(*DBG:                ;*)
(*DBG:            }*)
(*DBG:            else*)
(*DBG:            {*)
(*DBG:                swap_bytes(val, get_var_size(idx));*)
(*DBG:            }*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)