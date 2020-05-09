function [Phase_d] = arbitrary_phase_shift(t_out,y_out,pha_period)

% formula link: https://en.wikipedia.org/wiki/List_of_trigonometric_identities#Arbitrary_phase_shift
% helpful link: https://www.mathworks.com/matlabcentral/answers/439172-how-to-determine-the-phase-difference-phase-shift-between-two-signals

t = t_out;        % time vector
C1 = y_out(1,:);  % first oscillator
C2 = y_out(3,:);  % second oscillator

C1s = [mean(C1); 2*std(C1)];
C2s = [mean(C2); 2*std(C2)];
sinsum = C1 + C2;
sinsums = [mean(sinsum); 2*std(sinsum)];
c_fcn = @(theta) sqrt(C1s(2).^2 + C2s(2).^2 + 2*C1s(2).*C2s(2).*cos(theta)) - sinsums(2);
theta = fzero(c_fcn, 1);     % radian
thetadeg = theta*180/pi;     % degree
Phase_d = thetadeg*(0.07./pha_period);
phi_fcn = @(theta) atan2(C2s(2).*sin(theta), C1s(2) + C2s(2).*cos(theta));
phi = fminsearch(@(b)norm(phi_fcn(b)), 1);
%{
figure
plot(t, C1,   t, C2,    t, sinsum)
grid
legend('Ch 1', 'Ch 2', 'Ch 1 + Ch 2', 'Location','best')
text(250, 2, sprintf('\\theta = %.3f rad = %.3f\\circ', theta, thetadeg))
%}
end