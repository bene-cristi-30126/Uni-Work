y = @(n)((1.(mod(n, 2) == 1) + (-1).(mod(n , 2) == 0)).*(n > 0));
n = -2 : 10;
stem(n, y(n)); grid;