FUNCTION_BLOCK Decoder7Seg
  VAR_INPUT
    InputTal : INT;
  END_VAR
  VAR_OUTPUT
    a : BOOL;
    b : BOOL;
    c : BOOL;
    d : BOOL;
    e : BOOL;
    f : BOOL;
    g : BOOL;
  END_VAR

  CASE InputTal OF
      0, 10: a:=1; b:=1; c:=1; d:=1; e:=1; f:=1; g:=0;
      1: a:=0; b:=1; c:=1; d:=0; e:=0; f:=0; g:=0;
      2: a:=1; b:=1; c:=0; d:=1; e:=1; f:=0; g:=1;
      3: a:=1; b:=1; c:=1; d:=1; e:=0; f:=0; g:=1;
      4: a:=0; b:=1; c:=1; d:=0; e:=0; f:=1; g:=1;
      5: a:=1; b:=0; c:=1; d:=1; e:=0; f:=1; g:=1;
      6: a:=1; b:=0; c:=1; d:=1; e:=1; f:=1; g:=1;
      7: a:=1; b:=1; c:=1; d:=0; e:=0; f:=0; g:=0;
      8: a:=1; b:=1; c:=1; d:=1; e:=1; f:=1; g:=1;
      9: a:=1; b:=1; c:=1; d:=1; e:=0; f:=1; g:=1;
      ELSE
         a:=0; b:=0; c:=0; d:=0; e:=0; f:=0; g:=0;
  END_CASE;
END_FUNCTION_BLOCK

PROGRAM main
  VAR
    counter : INT;
    seg1_display : Decoder7Seg;
    resetValue : INT := 9;
    presetValue : INT := 10;
    resetTrigger : BOOL;
    CTU1 : CTU;
    TON0 : TON;
    TON_Timer : TIME := T#30ms;
    TON_trigger : BOOL;
    Seg1_trigger : BOOL;
  END_VAR
  VAR
    seg_a AT %QX0.0 : BOOL;
    seg_b AT %QX0.1 : BOOL;
    seg_c AT %QX0.2 : BOOL;
    seg_d AT %QX0.3 : BOOL;
    seg_e AT %QX0.4 : BOOL;
    seg_f AT %QX0.5 : BOOL;
    seg_g AT %QX0.6 : BOOL;
    BtnGreen AT %IX0.0 : BOOL;
  END_VAR

  Seg1_trigger := BtnGreen;
  TON0(IN := NOT(TON_trigger) AND Seg1_trigger, PT := TON_Timer);
  CTU1(CU := TON0.Q, R := resetTrigger, PV := presetValue);
  TON_trigger := TON0.Q;
  resetTrigger := CTU1.Q;
  counter := CTU1.CV;
  seg1_display(EN := TRUE, InputTal := counter);
  IF seg1_display.ENO THEN
      seg_a := seg1_display.a;
  END_IF;
  IF seg1_display.ENO THEN
      seg_b := seg1_display.b;
  END_IF;
  IF seg1_display.ENO THEN
      seg_c := seg1_display.c;
  END_IF;
  IF seg1_display.ENO THEN
      seg_d := seg1_display.d;
  END_IF;
  IF seg1_display.ENO THEN
      seg_e := seg1_display.e;
  END_IF;
  IF seg1_display.ENO THEN
      seg_f := seg1_display.f;
  END_IF;
  IF seg1_display.ENO THEN
      seg_g := seg1_display.g;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "348c5aee1e9af445ea5e96bdf3df2d0d";*)
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
(*DBG:char plc_program_md5[] = "348c5aee1e9af445ea5e96bdf3df2d0d";*)
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
(*DBG:    {&(RES0__INSTANCE0.COUNTER), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.INPUTTAL), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.A), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.B), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.C), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.D), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.E), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.F), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_DISPLAY.G), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RESETVALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PRESETVALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RESETTRIGGER), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.R), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.PV), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CV), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU_T.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU_T.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU_T.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU_T.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CTU1.CU_T.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON0.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON_TIMER), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TON_TRIGGER), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG1_TRIGGER), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_A), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_B), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_C), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_D), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_E), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_F), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SEG_G), BOOL_O_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BTNGREEN), BOOL_P_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               47*)
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
(*DBG:    case BOOL_ENUM:*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return sizeof(TIME);*)
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
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case BOOL_O_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_BOOL_p *) ptr)->flags & __IEC_FORCE_FLAG)*)
(*DBG:                        ? &(((__IEC_BOOL_p *) ptr)->fvalue)*)
(*DBG:                        : ((__IEC_BOOL_p *) ptr)->value);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return (void *)&((__IEC_TIME_t *) ptr)->value;*)
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
(*DBG:        case TIME_ENUM: {*)
(*DBG:            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
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
(*DBG:        case TIME_ENUM:*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
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