% the script file for testing the code
% the curve
X = @(t) 2*cos(2*pi*t);
Y = @(t) 3*sin(2*pi*t);

dXdt = @(t) -4*pi*sin(2*pi*t); % derivative for X(t)
dYdt = @(t) 6*pi*cos(2*pi*t); % derivative for Y(t)

% point to be projected
x0 = -3;
y0 = 0;

% desired accuracy
eps = 0.01;

tic;
t = orthoProjectionOnCurve(x0,y0,X,Y,dXdt,dYdt,eps);
toc;

[X(t) Y(t)]
