PROGRAM main
  VAR
    DebounceTime : TIME := T#50ms;
    ledNo : INT;
    BtnDelay : BOOL;
    TONBtnDelay : TON;
    BtnTrigger : R_TRIG;
    triggerReset : BOOL;
    CountUpLEDNo : CTU;
    LEDRed_Active : BOOL := FALSE;
    LEDYellow_Active : BOOL := FALSE;
    LEDGreen_Active : BOOL;
    LEDBlue_Active : BOOL;
    R_TRIG0 : R_TRIG;
    pulseReset : BOOL;
  END_VAR
  VAR
    PushBtn AT %IX0.0 : BOOL;
    LEDBlue AT %QX0.0 : BOOL;
    LEDGreen AT %QX0.1 : BOOL;
    LEDYellow AT %QX0.2 : BOOL;
    LEDRed AT %QX0.3 : BOOL;
  END_VAR
  VAR
    _TMP_GT531915_ENO : BOOL;
    _TMP_GT531915_OUT : BOOL;
    _TMP_EQ7306377_ENO : BOOL;
    _TMP_EQ7306377_OUT : BOOL;
    _TMP_EQ5673830_ENO : BOOL;
    _TMP_EQ5673830_OUT : BOOL;
    _TMP_EQ3206029_ENO : BOOL;
    _TMP_EQ3206029_OUT : BOOL;
    _TMP_EQ6938677_ENO : BOOL;
    _TMP_EQ6938677_OUT : BOOL;
  END_VAR

  CountUpLEDNo(CU := _TMP_GT531915_ENO, R := triggerReset, PV := INT#4);
  TONBtnDelay(IN := PushBtn, PT := DebounceTime);
  BtnDelay := TONBtnDelay.Q;
  BtnTrigger(CLK := BtnDelay);
  _TMP_GT531915_OUT := GT(EN := BtnTrigger.Q, IN1 := ledNo, IN2 := INT#2, ENO => _TMP_GT531915_ENO);
  IF _TMP_GT531915_ENO THEN
      triggerReset := _TMP_GT531915_OUT;
  END_IF;
  ledNo := CountUpLEDNo.CV;
  _TMP_EQ7306377_OUT := EQ(EN := TRUE, IN1 := ledNo, IN2 := INT#0, ENO => _TMP_EQ7306377_ENO);
  LEDRed := LEDRed_Active AND _TMP_EQ7306377_ENO;
  IF _TMP_EQ7306377_ENO THEN
      LEDRed_Active := _TMP_EQ7306377_OUT;
  END_IF;
  _TMP_EQ5673830_OUT := EQ(EN := TRUE, IN1 := ledNo, IN2 := INT#1, ENO => _TMP_EQ5673830_ENO);
  LEDYellow := LEDYellow_Active AND _TMP_EQ5673830_ENO;
  IF _TMP_EQ5673830_ENO THEN
      LEDYellow_Active := _TMP_EQ5673830_OUT;
  END_IF;
  _TMP_EQ3206029_OUT := EQ(EN := TRUE, IN1 := ledNo, IN2 := INT#2, ENO => _TMP_EQ3206029_ENO);
  LEDGreen := LEDGreen_Active AND _TMP_EQ3206029_ENO;
  IF _TMP_EQ3206029_ENO THEN
      LEDGreen_Active := _TMP_EQ3206029_OUT;
  END_IF;
  _TMP_EQ6938677_OUT := EQ(EN := TRUE, IN1 := ledNo, IN2 := INT#3, ENO => _TMP_EQ6938677_ENO);
  LEDBlue := LEDBlue_Active AND _TMP_EQ6938677_ENO;
  IF _TMP_EQ6938677_ENO THEN
      LEDBlue_Active := _TMP_EQ6938677_OUT;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "9053a30cc71d3f2e4cf4ad5a0cfca147";*)
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
(*DBG:char plc_program_md5[] = "9053a30cc71d3f2e4cf4ad5a0cfca147";*)
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
(*DBG:    {&(RES0__INSTANCE0.DEBOUNCETIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDNO), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNDELAY), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TONBTNDELAY.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNTRIGGER.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNTRIGGER.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNTRIGGER.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNTRIGGER.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNTRIGGER.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TRIGGERRESET), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.R), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.PV), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CV), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU_T.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU_T.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU_T.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU_T.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.COUNTUPLEDNO.CU_T.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDRED_ACTIVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDYELLOW_ACTIVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDGREEN_ACTIVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDBLUE_ACTIVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG0.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PULSERESET), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PUSHBTN), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDBLUE), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDGREEN), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDYELLOW), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.LEDRED), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT531915_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT531915_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ7306377_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ7306377_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ5673830_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ5673830_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ3206029_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ3206029_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ6938677_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_EQ6938677_OUT), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               56*)
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
(*DBG:    case TIME_ENUM:*)
(*DBG:        return sizeof(TIME);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return sizeof(SINT);*)
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
(*DBG:    case TIME_ENUM:*)
(*DBG:        return (void *)&((__IEC_TIME_t *) ptr)->value;*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_BOOL_p *) ptr)->flags & __IEC_FORCE_FLAG)*)
(*DBG:                        ? &(((__IEC_BOOL_p *) ptr)->fvalue)*)
(*DBG:                        : ((__IEC_BOOL_p *) ptr)->value);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return (void *)&((__IEC_SINT_t *) ptr)->value;*)
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
(*DBG:        case TIME_ENUM: {*)
(*DBG:            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
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
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        case SINT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    *)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case TIME_ENUM:*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_O_ENUM:*)
(*DBG:        case BOOL_P_ENUM:*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case SINT_ENUM:*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
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