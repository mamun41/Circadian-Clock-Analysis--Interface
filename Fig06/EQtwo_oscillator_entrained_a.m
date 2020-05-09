function dydt = EQtwo_oscillator_entrained_a(t,y,Z)
global kd k K n b Sa Kds
dydt = zeros(6,1);
ylag1 = Z(:,1);
ylag2 = Z(:,2);
ylag3 = Z(:,3);
ylag4 = Z(:,4);
ylag5 = Z(:,5);
ylag6 = Z(:,6);

% activator binding
dydt(1) = b + k(1)*K(2)^n/(K(2)^n+ylag2(2)^n)*ylag4(4)/(K(1)+ylag4(4)) - kd(1) *y(1)*y(5)/(Sa + y(5));
dydt(2) = ylag1(1) - y(2);
dydt(3) = b + k(2)*K(2)^n/(K(2)^n+ylag4(4)^n)*ylag2(2)/(K(1)+ylag2(2)) - kd(2) *y(3)  ;
dydt(4) = ylag3(3) - y(4);
dydt(5) = b + k(3)*K(2)^n/(K(2)^n + ylag6(6)^n) - Kds*y(5);
dydt(6) = ylag5(5) - y(6);

