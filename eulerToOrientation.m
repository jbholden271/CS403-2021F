function rotMatrix = eulerToOrientation(eAng)
% Converts a ZYX Euler angle vector to an orientation(rotation) matrix
Rx = [1 0 0; 0 cos(eAng(3)) -sin(eAng(3)); 0 sin(eAng(3)) cos(eAng(3))];
Ry = [cos(eAng(2)) 0 sin(eAng(2)); 0 1 0; -sin(eAng(2)) 0 cos(eAng(2))];
Rz = [cos(eAng(1)) -sin(eAng(1)) 0; sin(eAng(1)) cos(eAng(1)) 0; 0 0 1];
rotMatrix = Rz*Ry*Rx;
end

