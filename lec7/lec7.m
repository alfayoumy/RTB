%%
mdl_puma560
p560.plot(qz)
T = transl(0.6, 0.1, 0) * rpy2tr(0, 180, 0, 'deg', 'xyz')
hold on
trplot(T)
q = p560.ikine6s(T) %6 degrees of freedom and s for spherical wrist
p560.plot(q)
% p560.plot3d(q) % takes time to load to build CAD
ql = p560.ikine6s(T, 'l') %left-hand pose
p560.plot(ql)
qr = p560.ikine6s(T, 'r') %right-hand pose
p560.plot(qr)
q = p560.ikine6s(T, 'rd') %'r'igh-hand pose with elbow 'd'own
% p560.plot3d(q) % takes time to load to build CAD
%%
tg = jtraj(qz, ql, 50); %trajectory from 0 angle conf. to left hand conf.
p560.plot(tg)
%%
tg = jtraj(ql, qr, 50); %trajectory from right-hand conf. to left-hand conf.
p560.plot(tg)
%%
mdl_planar2
p2.plot(qz) %zero conf
T = transl(1, 1, 0) %robot is in 2d, z has to be 0
q = p2.ikine(T, 'q0', [0 0], 'mask', [1 1 0 0 0 0])
%   T desired end effector pose
%	[0 0] initial angle 'q0'
%	[1 1 0 0 0 0]) only try matching X and Y positions, robot has 2 DOF 'mask'
p2.plot(q)
q = p2.ikine(T, 'q0', [10 10], 'mask', [1 1 0 0 0 0])
p2.plot(q)
%%
mdl_puma560
p560.plot(qz)
T2 = transl(0.6, 0.2, 0) * rpy2tr(0, 180, 180, 'deg', 'xyz')
hold on
trplot(T2)
q = p560.ikcon(T2, [0 0 0 0 0 0]) %zeroes initial conditions will not converge
p560.plot(q)

mdl_hyper3d(20) %redundunt robot in 3d with 20 joints
q = h3d.ikcon(T2, qz) % pose, initial joint angles
h3d.fkine(q)
h3d.plot(q)
hold on
trplot(T2) % slight difference due to use of ikcon instead of ikine


mdl_puma560
TA = transl(0.4, 0.2, 0) * trotx(pi)
TB = transl(0.4, -0.2, 0) * trotx(pi/2)
qA = p560.ikine6s(TA)
qB = p560.ikine6s(TB)
tg = jtraj(qA, qB, 50);

figure(1)
p560.plot(tg) %plot trajectory interpolating joint angles

figure(2)
qplot(tg) %plot joint angles

Ts = ctraj(TA, TB, 50);
Ts(:,:,1) 
qs = p560.ikine6s(Ts); %compute joint angles for every pose in this matrix Ts

figure(3)
p560.plot(qs) %plot trajectory interpolating cartesian poses

figure(4)
qplot(qs)