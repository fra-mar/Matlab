% creates a graph showing relation between area and volume in sphere
%...and cylinder
%
% the idea is to understand heat loses in children vs adults
% 
radius = [5:0.1:30]         %array 100 elements increasing radius 0-5
A = 4*pi*radius.^2;          %array with area
V = (4/3)*pi*radius.^3;      %same for volume

h=[50:0.48:170]             %array with heights that match radius
Ac =radius.^2 *pi *2 + (h.*radius.*2*pi) %same for a cilinder
Vc =h.*radius.^2 *pi *2


subplot(2,2,1)
plot(A,V)
xlabel('Area')
ylabel('Volume')
title('Relation Area/Volume - sphere')

subplot(2,2,2);plot(Ac,Vc)
xlabel('Area')
ylabel('Volume')
title('Relation Area/Volume - cylinder')


subplot(2,2,3)
plot(radius, A)
hold on
plot (radius, V)
plot (radius, Ac,'r--')
plot (radius, Vc, 'r:')
xlabel('Radius')
title('A and V (both sphere and cylinder) vs radius')
legend('Area','Volume','Area ci','Volumen ci')
hold off

subplot(2,2,4)
hold on
plot(radius, A./V)
plot (radius, Ac./Vc)
xlabel('Radius')
title('A/V vs radius')
legend('Sphere','Cylinder')
hold off
