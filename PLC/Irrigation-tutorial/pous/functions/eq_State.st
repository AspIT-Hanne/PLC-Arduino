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