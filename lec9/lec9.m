mdl_puma560
p560.plot(qn) %q nominal
T = p560.fkine(qn) %homogeneous transformatio matrix of forward kinematics
% of qn pose
Td = p560.fkine(qn + [0.01 0 0 0 0 0]) %added disturbance to joint 1,
% joints 2 to 6 are the same
%%
J = p560.jacobe(qn)
det(J)
inv(J) % is not zero
rank(J) % 6 unique columns
J = p560.jacobe(qz)
det(J) % is zero
rank(J) % 5 unique columns only out of the 6 columns
%%
J = p560.jacobe(qn)
nu = [0 0 1 0 0 0]' % spatial velocity is 1 unit in z
inv(J) * nu % joint angle velocity vector that will give me the desired 
% spatial velocity vector
%%
mdl_puma560
p560.plot(qn)
p560.vellipse(qn, 'fillcolor', 'b', 'edgecolor', 'w', 'alpha', 0.5) 
% blue ellipse, white edges, translucent
p560.plot(qs)
p560.vellipse(qs, 'fillcolor', 'b', 'edgecolor', 'w', 'alpha', 0.5) 
%%
mdl_hyper3d(20) %redundunt robot in 3d with 20 joints
q = rand(1,20) % 20 random joint configuration angles
h3d.plot(q)
J = h3d.jacobe(q)
% inv(J) % error, matrix is not a square
pinv(J) % psuedo inverse of the jacobian matrix: 20x6 matrix
N = null(J) % null space matrix of the jacobian matrix: 20x14 matirx
rank(J) % 6 unique columns, 14 columns in the null space