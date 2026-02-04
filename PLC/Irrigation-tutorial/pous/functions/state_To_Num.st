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