// Program name
Program Ëàáà1;

// Determining the Console Program Type
{$APPTYPE CONSOLE }

// Importing libraries
Uses
  System.SysUtils;

// Variable declaration section
Var
  X: real;
  N: integer;
  Up, Down, Sum1, Sum, Sum2, F: real;
{X - iterative variable of cycle A1;
N - iterative variable of cycles A2 and A3;
Up - value of fraction's numerator;
Down - value of fraction's detominator ;
Sum1 - value of fraction;
Sum - sum of fractions in cycle;
Sum2 - value of first multiplier;
F - value of function;}

Begin
  // Setting initial value of iterative variable
  X := 0.6;

  { The begining of cycle A1. Count value of function for each value of X from 0.6 to 1.2 }
  While X <= 1.2 do
  Begin
    // Resetting variable before starting another cycle
    Sum := 0;
    // Setting initial value of iterative variable
    N := 1;

    { The begining of cycle A2. Count sum of 9 fractions }
    While N <= 9 do
    Begin
      // Count value of fraction on this step
      Up := ln(N + X) * cos((N + exp(ln(abs(sin(X))) * (1 / 5))) / (N * X));
      Down := 1 + ln(N * X);
      Sum1 := Up / Down;
      // Count sum of N fractions
      Sum := Sum + Sum1;
      N := N + 1
    End;
    // End of cycle A2

    // Setting initial value of iterative variable
    N := 10;

    { The begining of cycle A3. Count value of function for each N from 10 to 15 }
    While N <= 15 do
    Begin
      // Count value of fraction on this step
      Up := ln(N + X) * cos((N + exp(ln(abs(sin(X))) * (1 / 5))) / (N * X));
      Down := 1 + ln(N * X);
      Sum1 := Up / Down;
      // Count sum of N fractions
      Sum := Sum + Sum1;

      // Count value of first multiplier
      Sum2 := exp(ln(1 + cos(Pi * X / N)) * (1 / 3));

      // Count value of function
      F := Sum * Sum2;

      // Output
      Writeln(X:4:2, ' ', N, ' ', F:4:2);

      N := N + 1
    End;
    // End of cycle A3
    Writeln;
    X := X + 0.15
  End;
  // End of cycle A1

  Readln
End.
