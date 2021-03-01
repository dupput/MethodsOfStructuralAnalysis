% Define problem variables (as globals)
global H L k c m g
H=100; L=60; k=80; c=20; m=100; g=10;
% Solve using the ode45 solver for high accuracy
[t,z] = ode45(@f, [0:1:100], [H;0]); % The initial value must be a vector
% Plot the results
plot(t,z(:,1)) % You need the 1st column of the vector for the position z1
xlabel('t (sec)'); ylabel('z (m)'); grid on

% This is the ODE function to solve
function dzdt=f(t,z)    
    global H L k c m g % Don’t forget the global variables
    dzdt(1,1)=z(2); % This needs to be defined as a vector. z1 is the 1st row.
    if z(1)<H-L
        dzdt(2,1)=(1/m)*(k*(H-L)-m*g-c*z(2)-k*z(1)); % z2 is the 2nd row.
    else
        dzdt(2,1)=-(1/m)*(m*g+c*z(2));
    end
end