close all;
clc;

% initialize frames
frame0 = SE3([0 0 0], eulerToOrientation([0 0 0]));
frame1 = SE3([0.4 0.8 1.2], eulerToOrientation([0.3 0.2 0.5]));
frame2 = SE3([-0.4 0.5 1], eulerToOrientation([0.7 pi pi/2]));
frame3 = SE3([0.5 -0.8 1.2], eulerToOrientation([pi/3 0 0]));
% calculate positions
frame1_r = mult(frame0, frame1);
frame2_r = mult(frame1_r, frame2);
frame3_r = mult(frame2_r, frame3);
t = 0;

figure

for i=1:50
    clf;
    t = t+0.02;
    theta = pi*t;
    hold on
    
    % draw the arm
    drawLine3D(SE3.getPos(frame0),SE3.getPos(frame1_r));
    drawLine3D(SE3.getPos(frame1_r),SE3.getPos(frame2_r));
    drawLine3D(SE3.getPos(frame2_r),SE3.getPos(frame3_r));
    drawCoordinate3D(SE3.getRot(frame0),SE3.getPos(frame0));
    drawCoordinate3D(SE3.getRot(frame1_r),SE3.getPos(frame1_r));
    drawCoordinate3D(SE3.getRot(frame2_r),SE3.getPos(frame2_r));
    drawCoordinate3D(SE3.getRot(frame3_r),SE3.getPos(frame3_r));
    
    % find end effector
    posVecEE = [(sin(theta)*0.1+0.05); (cos(theta)*0.3+0.08); (sin(theta)+0.5)];
    rotMatEE = SE3.getRot(frame3);
    frameEE = SE3(posVecEE, rotMatEE);
    frameEE_r = mult(frame3_r, frameEE);

    % draw the end effector
    drawLine3D(SE3.getPos(frame3_r),SE3.getPos(frameEE_r));
    drawCoordinate3D(SE3.getRot(frameEE_r),SE3.getPos(frameEE_r));
    
    % axis label
    xlabel('$x$','interpreter','latex','fontsize',20)
    ylabel('$y$','interpreter','latex','fontsize',20)
    zlabel('$z$','interpreter','latex','fontsize',20)
    axis equal
    view(85,10)
    
    pause(0.001);
    hold off
    grid on
end
