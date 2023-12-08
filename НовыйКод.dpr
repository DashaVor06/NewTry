// Program name
Program НовыйКод;

// Determining the Console Program Type
{$APPTYPE CONSOLE}

{Find Nth Super Smith number being full square}

// Importing libraries
Uses
  SysUtils;

// Constant declaration section
Const
  Size = 46340;
  //Size - the size of the array

// Variable declaration section
Var
  N, Error: Integer;
  StrN: String;
  WrongN: boolean = false;
  Now1, Now2, Sum_of_Now: longint;
  Sum_of_Digits, Sum_of_Del, Kol_Del: longint;
  Smith, Sum_of_Smith: longint;
  i, j, Curr,  Del, Root: longint;
  Sm: boolean;
  a: array [1 .. Size] of longint;
{
N - Super Smith number
StrN - the input string value of N
WrongN - shows if user wrote wrong data at least one time
Error - the number of the first element that is not a number in StrN
Now1 - the number that is checking on being Smith number
Now2 - gets value of Now1 for calculations
Sum_of_Now - sum of digits of Now1
Del - divisor
Sum_of_Digits - sum of digits of Del
Sum_of_Del - sum of digits of all dividers
Kol_Del - the amount of dividers of Now1
Smith - gets value of Sum_of_Now if it is Smith number
Sum_of_Smith - sum of digits of Smith
Sm - gets value true if number is Smith
i - iterative variable
j - iterative variable
Curr - the number of Super Smith now
Root - root of Smith
a - array
}

Begin
  {The beginning of Cycle A0. Input. Checking if users data is right}
  Repeat

    // User has written data at least one time
    If WrongN then
      Writeln ('Your data is not right. Please try again');

    // Read string StrN and transorm it into number N
    Write('Write N not bigger than 36: = ');
    Readln(StrN);
    Val (StrN, N, Error);
    WrongN := true;
  Until (Error = 0) and (N > 0) and (N < 37);
  // The end of the cycle A0

  // Cycle A1. Filling the array from 2 to 46340
  For i := 1 to Size - 1 do
    a[i] := i + 1;

  j := 1;

  // Cycle A2. Assigning all composite numbers value 0
  While j < Size do
  Begin

    // If a[j] <> 0 it is simple
    If (a[j] <> 0) then
    Begin
      i := j;

      //Cycle A2.1. Assign numbers multiple a[j] value 0
      While (i + a[j]) < Size do
      Begin
        i := i + a[j];
        a[i] := 0;
      End;
    End;
    Inc(j);
  End;

  j := 0;
  Curr := 0;

  // The begining of cycle A3. Counting Super Smith with number N
  Repeat
    Sm := false;

    // The begining of cycle A3.1. Looking for Smith number being full square
    Repeat
      Inc(j);

      If a[j] <> 0 then
      Begin
        Del := a[j];
        Sum_of_Digits := 0;

        // Cycle A3.1.1. Counting sum of digits of Del
        While Del <> 0 do
        Begin
          Sum_of_Digits := Sum_of_Digits + Del mod 10;
          Del := Del div 10;
        End;

        //Counting sum of digits of all divisors of Now1
        Sum_of_Del := 2 * Sum_of_Digits;

        //Counting Now1
        Now1 := a[j] * a[j];
        Now2 := Now1;

        Sum_of_Now := 0;

        // Cycle A3.1.2 Counting sum of digits of Now1
        While Now2 <> 0 do
        Begin
          Sum_of_Now := Sum_of_Now + Now2 mod 10;
          Now2 := Now2 div 10;
        End;

        // Checking if Now1 is Smith number
        If Sum_of_Del = Sum_of_Now then
        Begin
          Sm := true;
          Root := a[j];
        End;
      End;
    Until Sm;
    // End of cycle A3.1. Cycle stops when Smith number was found

    //Now1 is Smith number so variable Smith gets value of Sum_of_Now
    Smith := Sum_of_Now;

    Sum_of_Smith := 0;

    // Cycle A3.2. Counting sum of digits of Smith
    While Smith <> 0 do
    Begin
      Sum_of_Smith := Sum_of_Smith + Smith mod 10;
      Smith := Smith div 10;
    End;

    i := 1;
    Smith := Sum_of_Now;
    Sum_of_Del := 0;

    // The begining of cycle A3.3. Counting sum of digits of all divisors of Smith
    Repeat
      // If a[j] is a divisor of Smith then
      If (a[i] <> 0) and (Smith mod a[i] = 0) then
      Begin
        Del := a[i];
        Sum_of_Digits := 0;

        // Cycle A3.3.1. Counting sum of digits of Del
        While Del <> 0 do
        Begin
          Sum_of_Digits := Sum_of_Digits + Del mod 10;
          Del := Del div 10;
        End;

        Del := a[i];
        Kol_Del := 0;

        //Cycle A3.3.2. Divide Smith by a[j] utill it is possible
        While (Smith > 1) and (Smith mod Del = 0) do
        Begin
          Smith := Smith div Del;
          Kol_Del := Kol_Del + 1;
          Sum_of_Del := Sum_of_Del + Sum_of_Digits;
        End;
      End;

      Inc(i);
    Until (Smith = 1) or (i = Sum_of_Now div 2);
    // The end of cycle A3.3. Cycle stops when all divisors were found

    // Checking if Smith is Super Smith. If yes - increase the number of Super Smith now
    If (Sum_of_Del = Sum_of_Smith) and (Kol_Del <> 0) then
      Curr := Curr + 1;

  Until Curr = N;
  // The end of cycle A3. Cycle stops when Super Smith with number N was found

  // Output
  Writeln('Smith Super number (', N, ') = ', Now1, '; Root: ', Root);
  Readln;
End.
