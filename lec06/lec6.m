clear
clc
%%
a1 = 1;
q1 = 0.2;
trchain2('R(q1) Tx(a1)', q1) %pose of end effector
x = ans(1,3) %x coordinate of end effector
y = ans(2,3) %y coordinate of end effector
%%
syms q1 a1
trchain2('R(q1) Tx(a1)', q1) %pose of end effector
%%
mdl_planar1
p1.teach()
%%
a1 = 1;
a2 = 1;
q1 = 0.2;
q2 = 0.3;
trchain2('R(q1) Tx(a1) R(q2) Tx(a2)', [q1 q2])
syms q1 q2 a1 a2
trchain2('R(q1) Tx(a1) R(q2) Tx(a2)', [q1 q2])
%%
mdl_planar2
p2.teach
p2.plot([0 pi/2])
p2.plot([pi/2 -pi/2])
%%
syms q1 q2 q3 a1 a2 a3
trchain2('R(q1) Tx(a1) R(q2) Tx(a2) R(q3) Tx(a3)', [q1 q2 q3])
x = ans(1,3) %x coordinate of end effector
y = ans(2,3) %y coordinate of end effector
mdl_planar3
p3.teach
%%
syms a1 a2 a3 a4 q1 a2 q3 q4
trchain('Rz(q1)Tz(a1)Ry(q2)Tz(a2)Ry(q3)Tz(a3)Ry(q4)Tz(a4)', [q1 q2 q3 q4])
x = ans(1,4) %x coordinate of end effector
y = ans(2,4) %y coordinate of end effector
z = ans(3,4) %z coordinate of end effector
%%
dh = [
    0 0 1 0 % theta d a alpha for joint 1
    0 0 1 0 % theta d a alpha for joint 2
    ] 
r = SerialLink(dh)
r.plot([0.2 0.3])
r.teach
r.fkine([0.2 0.3]) %return homogeneous transformation matrix of end effector pose
%%
mdl_puma560
p560
p560.plot(qz)
p560.plot(qr)
p560.teach
p560.fkine([.1 .2 .3 0 0 0])
%%
p560.base = transl(10, 15, 2)
p560.fkine([.1 .2 .3 0 0 0])
%%
p560.base = transl(10, 15, 2) * trotx(pi)
p560.fkine([.1 .2 .3 0 0 0])
%%
p560.tool = transl(0, 0, 0.2)
p560.fkine([.1 .2 .3 0 0 0])
