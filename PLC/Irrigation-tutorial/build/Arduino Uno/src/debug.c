/*
 * This file is part of OpenPLC Runtime
 *
 * Copyright (C) 2023 Autonomy, GP Orcullo
 * Based on the work by GP Orcullo on Beremiz for uC
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <stdbool.h>

#include "iec_types_all.h"
#include "POUS.h"

#define SAME_ENDIANNESS      0
#define REVERSE_ENDIANNESS   1

char plc_program_md5[] = "589b2a69a2320cf26758909dc5ef32e5";

uint8_t endianness;


extern MAIN RES0__INSTANCE0;

static const struct {
    void *ptr;
    __IEC_types_enum type;
} debug_vars[] = {
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.MOISTURE), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.T_MAX), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.MAN_MODE), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TIMEOUT), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.RUN_VALVE), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.PT), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.ET), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.STATE), SINT_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.PREV_IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.CURRENT_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TON0.START_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.PT), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.ET), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.STATE), SINT_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.PREV_IN), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.CURRENT_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0.TOF0.START_TIME), TIME_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_EQ_STATE9508441_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_EQ_STATE9508441_OUT), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_SET_STATE9543617_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.IRRIGATION_MAIN_CONTROLLER0._TMP_SET_STATE5400491_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.STATE), INT_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.STOPPED_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.RUNNING_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY0.MANUAL_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.MANUAL_CONTROL), BOOL_ENUM},
    {&(RES0__INSTANCE0.MANUAL_OVERRIDE0.VALVE), BOOL_ENUM},
    {&(RES0__INSTANCE0.LOW_MOISTURE_SENSOR), BOOL_ENUM},
    {&(RES0__INSTANCE0.MANUAL_VALVE), BOOL_ENUM},
    {&(RES0__INSTANCE0.VALVE), BOOL_ENUM},
    {&(RES0__INSTANCE0.R_TRIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.R_TRIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.R_TRIG0.CLK), BOOL_ENUM},
    {&(RES0__INSTANCE0.R_TRIG0.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.R_TRIG0.M), BOOL_ENUM},
    {&(RES0__INSTANCE0.F_TRIG0.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.F_TRIG0.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.F_TRIG0.CLK), BOOL_ENUM},
    {&(RES0__INSTANCE0.F_TRIG0.Q), BOOL_ENUM},
    {&(RES0__INSTANCE0.F_TRIG0.M), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.EN), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.STATE), INT_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.STOPPED_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.RUNNING_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.STATE_DISPLAY1.MANUAL_LED), BOOL_ENUM},
    {&(RES0__INSTANCE0.STOPPED_LED), BOOL_O_ENUM},
    {&(RES0__INSTANCE0.RUNNING_LED), BOOL_O_ENUM},
    {&(RES0__INSTANCE0.MANUAL_LED), BOOL_O_ENUM},
    {&(RES0__INSTANCE0.SET_MANUAL), BOOL_P_ENUM},
    {&(RES0__INSTANCE0._TMP_STATE_TO_NUM9679397_OUT), INT_ENUM},
    {&(RES0__INSTANCE0._TMP_SET_STATE8504218_ENO), BOOL_ENUM},
    {&(RES0__INSTANCE0._TMP_SET_STATE8542285_ENO), BOOL_ENUM},
};

#define VAR_COUNT               67

uint16_t get_var_count(void)
{
    return VAR_COUNT;
}

size_t get_var_size(size_t idx)
{
    if (idx >= VAR_COUNT)
    {
        return 0;
    }
    switch (debug_vars[idx].type) {
    case INT_ENUM:
        return sizeof(INT);
    case BOOL_ENUM:
    case BOOL_O_ENUM:
    case BOOL_P_ENUM:
        return sizeof(BOOL);
    case SINT_ENUM:
        return sizeof(SINT);
    case TIME_ENUM:
        return sizeof(TIME);
    default:
        return 0;
    }
}

void *get_var_addr(size_t idx)
{
    void *ptr = debug_vars[idx].ptr;

    switch (debug_vars[idx].type) {
    case INT_ENUM:
        return (void *)&((__IEC_INT_t *) ptr)->value;
    case BOOL_ENUM:
        return (void *)&((__IEC_BOOL_t *) ptr)->value;
    case BOOL_O_ENUM:
    case BOOL_P_ENUM:
        return (void *)((((__IEC_BOOL_p *) ptr)->flags & __IEC_FORCE_FLAG)
                        ? &(((__IEC_BOOL_p *) ptr)->fvalue)
                        : ((__IEC_BOOL_p *) ptr)->value);
    case SINT_ENUM:
        return (void *)&((__IEC_SINT_t *) ptr)->value;
    case TIME_ENUM:
        return (void *)&((__IEC_TIME_t *) ptr)->value;
    default:
        return 0;
    }
}

void force_var(size_t idx, bool forced, void *val)
{
    void *ptr = debug_vars[idx].ptr;

    if (forced) {
        size_t var_size = get_var_size(idx);
        switch (debug_vars[idx].type) {
        case INT_ENUM: {
            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);
            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case BOOL_ENUM: {
            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);
            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case BOOL_O_ENUM: {
            memcpy((((__IEC_BOOL_p *) ptr)->value), val, var_size);
            memcpy(&((__IEC_BOOL_p *) ptr)->fvalue, val, var_size);
            ((__IEC_BOOL_p *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
        case BOOL_P_ENUM: {
            memcpy(&((__IEC_BOOL_p *) ptr)->fvalue, val, var_size);
            ((__IEC_BOOL_p *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
        case SINT_ENUM: {
            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);
            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        case TIME_ENUM: {
            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);
            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;
            break;
        }
    
        default:
            break;
        }
    } else {
        switch (debug_vars[idx].type) {
        case INT_ENUM:
            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case BOOL_ENUM:
            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case BOOL_O_ENUM:
        case BOOL_P_ENUM:
            ((__IEC_BOOL_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case SINT_ENUM:
            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        case TIME_ENUM:
            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;
            break;
        default:
            break;
        }
    }
}

void swap_bytes(void *ptr, size_t size)
{
    uint8_t *bytePtr = (uint8_t *)ptr;
    size_t i;
    for (i = 0; i < size / 2; ++i)
    {
        uint8_t temp = bytePtr[i];
        bytePtr[i] = bytePtr[size - 1 - i];
        bytePtr[size - 1 - i] = temp;
    }
}

void trace_reset(void)
{
    for (size_t i=0; i < VAR_COUNT; i++)
    {
        force_var(i, false, 0);
    }
}

void set_trace(size_t idx, bool forced, void *val)
{
    if (idx >= 0 && idx < VAR_COUNT)
    {
        if (endianness == REVERSE_ENDIANNESS)
        {
            // Prevent swapping for STRING type
            if (debug_vars[idx].type == STRING_ENUM)
            {
                // Do nothing
                ;
            }
            else
            {
                swap_bytes(val, get_var_size(idx));
            }
        }

        force_var(idx, forced, val);
    }
}

void set_endianness(uint8_t value)
{
    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)
    {
        endianness = value;
    }
}
