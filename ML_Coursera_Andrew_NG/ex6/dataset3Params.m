function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

params = [.01 , .03, .1, .3, 1, 3, 10, 30 ];
x1 = [1 2 1]; x2 = [0 4 -1];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Mat = []

for C=1:8
    for sigma = 1:8
        model = svmTrain(X,y, params(C), @(x1, x2) gaussianKernel(x1, x2, params(sigma) ));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        fprintf ('C = %f \n sigma = %f \n error = %f ',params(C), params(sigma), error)
        Mat = [Mat; params(C), params(sigma), error];
    end
end
% for_err = 100000000000;
% for_Index = 0;
% for i = 1:size(Mat,1)
%     if (Mat(i,3) < for_err)
%         for_err = Mat(i,3);
%         for_Index = i;
%     end
% end 
% 
% fprintf ('C = %f \n sigma = %f \n error = %f ',Mat(for_Index,1),  Mat(for_Index,2), Mat(for_Index,3) );

[V,I] = min(Mat(:,3));
C = Mat(I,1); sigma = Mat(I,2); error = Mat(I,3);
fprintf('----------------------------Minimmum----------------------------------')
fprintf ('C = %f \n sigma = %f \n error = %f ', C,sigma , error)

% =========================================================================

end
