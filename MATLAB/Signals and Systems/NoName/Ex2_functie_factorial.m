function factorial = Ex2_functie_factorial(n)
if n==1
    factorial = 1;
    return;
end
factorial = n* Ex2_functie_factorial(n-1);
end