close all;
clc;
clf;

frame0 = SE3([0 0 0], eulerToOrientation([0 0 0]));
frame1 = SE3([0.3 0.2 0.5], eulerToOrientation([0.4 0.8 1.2]));
frame1_r = mult(frame0, frame1);
frame2 = SE3([0.7 pi pi/2], eulerToOrientation([-0.4 0.5 1]));
frame2_r = mult(frame1_r, frame2);
frame3 = SE3([pi/3 0 0], eulerToOrientation([0.5 -0.8 1.2]));
frame3_r = mult(frame2_r, frame3);

% draw figure
figure
hold on
grid on
drawLine3D(SE3.getPos(frame0),SE3.getPos(frame1_r));
drawLine3D(SE3.getPos(frame1_r),SE3.getPos(frame2_r));
drawLine3D(SE3.getPos(frame2_r),SE3.getPos(frame3_r));
drawCoordinate3D(SE3.getRot(frame0),SE3.getPos(frame0));
drawCoordinate3D(SE3.getRot(frame1_r),SE3.getPos(frame1_r));
drawCoordinate3D(SE3.getRot(frame2_r),SE3.getPos(frame2_r));
drawCoordinate3D(SE3.getRot(frame3_r),SE3.getPos(frame3_r));
xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('$y$','interpreter','latex','fontsize',20)
zlabel('$z$','interpreter','latex','fontsize',20)
axis equal

view(25,30)