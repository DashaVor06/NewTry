program Hometask12деление;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

var
  n, del, d, pr: integer;

begin
  readln (n);

  for del := 2 to n do
  begin
    pr := 0;

    for d := 1 to trunc(sqrt(del + 1)) do
    begin
      if (del mod d = 0) then
        pr := pr + 1;
    end;

    if (pr = 1) then
      write (del, ' ');

  end;

  readln;
end.

