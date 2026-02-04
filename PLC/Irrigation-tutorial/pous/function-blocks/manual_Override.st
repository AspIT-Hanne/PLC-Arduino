FUNCTION_BLOCK manual_Override
VAR_INPUT
	State : irrigation_State;
	Manual_control : bool;
END_VAR

VAR_OUTPUT
	Valve : bool;
END_VAR

if State = Manual then  
    Valve := Manual_control;
elsif State = Stopped then
    Valve := false;
elsif State = Running then
    Valve := true;
end_if;

END_FUNCTION_BLOCK