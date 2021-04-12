clear
clc
rot2(0)
R = rot2(30, 'deg')
c1 = R(:,1)
c2 = R(:,2)
dot(c1, c2)
det(R)
%trplot2(R)
axis equal


transl2(1,2)
trot2(30, 'deg')

transl2(1,2) * trot2(30, 'deg')
SE2(1, 2, 30, 'deg') %same as line above
axis([0 5 0 5]) %x from 0 to 5 and y from 0 to 5
axis square
hold on
T1 = SE2(1, 2, 30, 'deg')
trplot(T1, 'frame', '1', 'color', 'b')
T2 = SE2(2, 1, 0)
trplot(T2, 'frame', '2', 'color', 'r')
T3 = T1*T2
trplot(T3, 'frame', '3', 'color', 'g')
T4 = T2*T1 %different order than T3
trplot(T4, 'frame', '4', 'color', 'c')

P = [3 2]'
plot_point(P, '*')
P1 = double(inv(T1)) * [P;1] %P wrt frame 1
