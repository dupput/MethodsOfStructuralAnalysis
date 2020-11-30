clc
clear

d = 0.01;
c_var = linspace(-1,4.5,3000);
cond_no = zeros(size(c_var, 2));
ii = 1;

for c = c_var
    a = [1, 2; 1, c];
    b = [3;3];
    b_err = [3; 3*(1 + d)]';
    cond_no(ii) = cond(a);
    ii = ii + 1;
end

semilogy(c_var, cond_no)
