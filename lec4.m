T0 = eye(4,4)
T1 = transl(1,2,3)*rpy2tr(0.6, 0.8, 1.4, 'xyz') 
% the default corresponds to rotations about the Z, Y, X axes
% respectively
%%
trplot(T0)
trplot(T1)
tranimate(T0,T1)
%%
tpoly(0, 1, 50) %initial s, final s, time steps (graph)
s = tpoly(0, 1, 50) %vector s
[s, sd, sdd] = tpoly(0, 1, 50) %vectors s, sd, sdd
%%
tpoly(0, 1, 50, 0.5, 0) %initial s, final s, time steps, initial v, final v
%%
lspb(0, 1, 50)
s = lspb(0, 1, 50)
[s, sd, sdd] = lspb(0, 1, 50)
%%
lspb(0, 1, 50, 0.025)
lspb(0, 1, 50, 0.035)
%%
mstraj([40;10;30], 1, [], 10, 0.1, 2)
% first point: 10,  last point: 30
% via points: 40,10
% velocity is 1 unit per sec
% time interval = 0.1
% t_acc (acceleration time) = 2
%%
mstraj([40;10;30], 1, [], 10, 0.1, 8)
% smooth but misses the point
%%
mstraj([40;10;30], 2, [], 10, 0.1, 4)
% double the speed
%%
mstraj([40;10;30], [], [10 30 20], 10, 0.1, 4)
% first segment lasts for 10 seconds
% second segment lasts for 30 seconds
% third segment lasts for 20 seconds
%%
first = [10 20]
last = [30 10]
x = jtraj(first, last, 50)
% [10 20] is the first point
% [30 10] is the last point
plot(x)
[x, xd] = jtraj(first, last, 50)
plot(xd)
v_initial = [0 0]
v_final = [10 10]
[x, xd] = jtraj(first, last, 50, v_initial, v_final)
plot(xd)
%%
% 3d example
start = [40 50]
via = [60 30; 40 10; 20 30; start]
x = mstraj(via, 2, [], start, 0.1, 1)
plot(x) %plot traj vs time
plot(x(:,1), x(:,2)) %plot p1 vs p2
%%
v_x = 1 %v in x axis
v_y = 3 %v in y axis
x = mstraj(via, [v_x v_y], [], start, 0.1, 1)
plot(x) 
%takes twice as long because slowest axis (x axis)
% is half the speed
%%
rpy_initial = [0 0 0]
rpy_final = [-pi/2 pi/2 pi/4]
x = jtraj(rpy_initial, rpy_final, 100) %100 time steps
plot(x)
R = rpy2r(x, 'xyz') %convert each row into rotation matrix
tranimate(R)
%%
q1 = UnitQuaternion
q2 = UnitQuaternion( rotx(pi/2) )
initial = q1.interp(q2, 0)
final = q1.interp(q2, 1)
halfway = q1.interp(q2, 0.5)
%%
T = ctraj(T0, T1, 50) %cardician trajectory of 50 time steps
tranimate(T)