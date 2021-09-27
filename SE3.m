classdef SE3
    % Class to represent the Special Euclidean group in 3D.
    
    properties
        Matrix
    end
    
    methods        
        function obj = SE3(posVector,rotMatrix)
            % Constructor for SE3 given rotation and translation
            obj.Matrix = [rotMatrix posVector(:); 0 0 0 1];
        end
        
        function newObj = mult(frame1, frame2)
            % Method for chaining SE3 frames in global perspective
            newObj.Matrix = frame1.Matrix * frame2.Matrix;
        end
    end
    
    methods (Static)
        function newObj = inverse(frame)
            % Method to invert SE3
            rotMatrix = frame.Matrix(1:3, 1:3);
            posVector = frame.Matrix(1:3, 4);
            rotInverted = transpose(rotMatrix);
            posInverted = -(rotInverted * posVector);
            newObj = SE3(posInverted, rotInverted);
        end
        
        function newObj = getPos(frame)
            % Returns position vector of a frame
            newObj = frame.Matrix(1:3, 4);
        end
        
        function newObj = getRot(frame)
            % Returns position vector of a frame
            newObj = frame.Matrix(1:3, 1:3);
        end
    end
end

