FUNCTION_BLOCK Decoder7Seg
VAR
END_VAR

CASE InputTal OF
    0: a:=1; b:=1; c:=1; d:=1; e:=1; f:=1; g:=0;
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