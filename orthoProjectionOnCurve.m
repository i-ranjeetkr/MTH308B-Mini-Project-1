function M = orthoProjectionOnCurve(x0,y0,X,Y,dXdt,dYdt,eps)
min = 9999;
for i = 1:50
    t = unifrnd(0,1);
    alpha = @(t) ((X(t) - x0)*dXdt(t) + (Y(t) - y0)*dYdt(t))/(sqrt((X(t)-x0)^2 + (Y(t)-y0)^2) * sqrt(dXdt(t)^2 + dYdt(t)^2));
    while(alpha(t) >= eps || alpha(t) <= -eps)
        f = (X(t) - x0)*dXdt(t) + (Y(t) - y0)*dYdt(t);
        f1 = dXdt(t)^2 + (X(t) - x0)*(-4*pi^2*X(t)) + dYdt(t)^2 + (Y(t) - y0)*(-4*pi^2*Y(t));
        t = t - f/f1;
    end
    N = (X(t) - x0)^2 + (Y(t) - y0)^2;
    if (N < min)
        min = N;
        M = t;
    end
end

end
