function sum = f(x)
sum = 0;
for n = 1:3
    sum = sum + abs(x(n+1)-x(n));
end
