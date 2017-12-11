function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
    
    h = theta(1) + (theta(2) .*X(:,2));
    % making a vector h wich contains the hypothesis value for each
    % observation

    summation = sum ((h-y).^2);
    %then calculate hypothesis - real price and make it to the power of 2
    % then sum all 
    J = summation /(2 * m);
    % cost = 1/2m * summation
    




% =========================================================================

end
