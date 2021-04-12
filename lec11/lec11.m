Jm = 200e-6
Bm = 817e-6
Km = 0.228
Kd = 1
simulink
%We can add an integral term to give a PID controller. Return the
%proportional gain to 1 and now change the integral term to 1. Run the
%model and open the original scope. We can see the effect of the integral
%term reducing the error of the disturbance back to zero, cancelling it out
%and the square wave response returning to that which we want.
%%
mdl_twolink
twolink.plot([0 0]) %q1 and q2 joint configurations. robot is operating in XZ plane

% 'r'ecrusive 'n'ewton 'e'uler method:
twolink.rne([0 0], [0 0], [0 0]) % output: torque on each joint
%inputs: (shoulder joint is q1 and elbow is q2)
% 1) joint configurations of each joint
% 2) velocity of each joint
% 3) acceleration of each joint

% plot axes of rotation of each joint
twolink.plot([0 0], 'jvec')
%%
mdl_twolink_sym
syms q1 q2 q1d q2d q1dd q2dd %joints conf, velocities of joints, acceleration of joints
tau = twolink.rne([q1 q2], [q1d q2d], [q1dd q2dd])
tau(1) % torque acting on joint 1
tau(2) % torque acting on joint 2

twolink.gravload([q1 q2]) % the torque acting on the joints due to gravity
% A link length, C center of mass, M mass of joint
tau = twolink.inertia([q1 q2], [q1d q2d], [q1dd q2dd])

%%
mdl_twolink
twolink.gravload([0 0])
twolink.plot([pi/2 0])
twolink.gravload([pi/2 0])

% add payload of 1 kg placed at coordinates 0 0 0 wrt the 2-link coordinate frame
twolink.payload(1, [0 0 0]) 
twolink.gravload([0 0]) % the new torque due gravity, now with added payload
twolink.plot([0 0])
%%
mdl_puma560
p560.gravload([0 0 0 0 0 0])
p560.plot([0 0 0 0 0 0])

p560.gravity = [0 0 9.81/6] %gravity on the moon
p560.gravload([0 0 0 0 0 0])
%%
mdl_twolink
twolink.inertia([0 0])
twolink.plot([0 0])

twolink.plot([0 pi/2])
twolink.inertia([0 pi/2])

twolink.plot([0 pi])
twolink.inertia([0 pi])
%%
mdl_puma560
sl_ztorque % in zero torque configuration the robot collapses under its own
% weight, due to joint friction the energy is quickly dissipated