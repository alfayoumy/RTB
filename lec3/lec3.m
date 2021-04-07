clear
clc
rotx(0.2)
R = rotx(30, 'deg')
det(R)
inv(R)
R' %will be same as above
roty(0.2)
rotz(0.3)
trplot(ans)

rotx(pi/2)*roty(pi/2)
roty(pi/2)*rotx(pi/2) %will be different than above

eul2r(0.1, 0.2, 0.3) %ZYZ euler angles to rotation matrix
tr2eul(ans) %rotation matrix to euler angles

%%there are two sets of euler angles that result in the same rotation
%%matrix

rpy2r(0.1, 0.2, 0.3) %roll pitch yaw angles to rotation matrix
tr2rpy(ans) %rotation matrix to roll pitch yaw angles

rpy2r(0.3, pi/2, 0.5)
rpy2r(0, pi/2, 0.8) 
%%both are equal because pitch = pi/2 so now roll and 
%%yaw are equivilant (gimbal lock) and the rotation = roll + yaw

R = eul2r(0.1, 0.2, 0.3)
trplot(R)
eig(R) %eigenvalues of the rotation matrix R
[v,e] = eig(R) %each column of v is an eigenvector
%%eigenvector is real when eigevalue is 1

[th,v] = tr2angvec(R) %th: angle of rotation needed, v: vector of rotation

angvec2r(th, v) %find rotation matrix R from 'th' and 'v'

q = UnitQuaternion(R) % q = s <v1,v2,v3>
q.plot()
inv(q)
q*inv(q) %0 rotation
q/q %=q*inv(q)
q*[1 0 0]'
q0 = UnitQuaternion
q0.interp(q, 1) %interpolation between q0 and q. 
%%0 is initial q. 1 is final q. 0.5 is interpolation halfway between
%%initial q and final q