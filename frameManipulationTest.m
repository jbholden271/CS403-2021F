frame0 = SE3([0 0 0], eulerToOrientation([0 0 0]));
frame1 = SE3([0.3 0.2 0.5], eulerToOrientation([0.4 0.8 1.2]));
frame2 = SE3([0.7 pi pi/2], eulerToOrientation([-0.4 0.5 1]));
frame3 = SE3([pi/3 0 0], eulerToOrientation([0.5 -0.8 1.2]));

disp("Frame Matrices");
disp(frame0.Matrix);
disp(frame1.Matrix);
disp(frame2.Matrix);
disp(frame3.Matrix);

endFrame = mult(mult(mult(frame0,frame1),frame2),frame3);

disp("End Frame");
disp(endFrame.Matrix);

invertedFrame = SE3.inverse(endFrame);

disp("Frame 3 to Frame 0");
disp(invertedFrame.Matrix);