A = [64, 31,  9,  4,  3, 39, -15;
     38, 92, 26, 89, 74, 270, 218;
     81, 43, 80, 91, 50, 225, -40;
     53, 18,  3, 80, 48, 178, 183;
     35, 90, 93, 10, 90, 110, 81;
     94, 98, 73, 26, 61, 150, 25;
     88, 44, 49, 34, 62, 112, 101;
     55, 11, 58, 68, 86, 147, 170;
     62, 26, 24, 14, 81, 54, 252;
     59, 41, 46, 72, 58, 185, 94;
     21, 59, 96, 11, 18, 81, -216;
     30, 26, 55, 65, 24, 156, -69;
     47, 60, 52, 49, 89, 158, 200;
     23, 71, 23, 78,  3, 227, -57;
     84, 22, 49, 72, 49, 166, 49;
     19, 12, 62, 90, 17, 192, -118;
     23, 30, 68, 89, 98, 208, 188;
     17, 32, 40, 33, 71, 98, 164;
     23, 42, 37, 70, 50, 182, 89;
     44, 51, 99, 20, 47, 91, -109];

B = [-311, -148, -1509, 159, 451, -407, 356, 673, 1871, -335, -1761, -1416, 784, -2108, -509, -2072, 369, 856, -449, -915]';

x = A\B;

[U,S,V] = svd(A);

Ut = transpose(U);

[d1,d2] = size(A);

x2 = 0;

for i = 1:d2
    x2 = x2 + ( ((Ut(i,:)*B)/S(i,i))*V(:,i) );
end

a = svd(A);

n = sum(a >= 0.001);

x3 = 0;

for i = 1:n
    x3 = x3 + ( ((Ut(i,:)*B)/S(i,i))*V(:,i) );
end

x4 =  transpose([1, -2, 3, -4, 5, -6, 7]);

disp(norm(x));
disp(x);
disp(norm(x2));
disp(x2);
disp(norm(x3));
disp(x3);
disp(norm(x4));
disp(x4);

msg=sprintf('Solution 3 was the closest to the actual values. I would never blindly rely on the norm, however, the lower the norm value the more accurate the solution became. Using the norm as a gauge for the level of accuracy is usefull.');
disp(msg);