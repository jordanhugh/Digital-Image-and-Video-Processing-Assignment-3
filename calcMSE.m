% This function takes as input two 2D array Y1 and Y2 containing
% the image intensities of two pictures and returns the mean square error
% between both Y1 and Y2.
function MSE = calcMSE(Y1, Y2)
    validateattributes(Y1, {'numeric', 'logical'}, ...
        {'real', 'nonempty', 'nonsparse'});
    validateattributes(Y2, {'numeric', 'logical'}, ...
        {'real', 'nonempty', 'nonsparse'});

    if ~isa(Y1,class(Y2))
        error('Y1 and Y2 must be of the same class');
    end
    
    if ~isequal(size(Y1),size(Y2))
        error('Y1 and Y2 must be of the same size');
    end

    if isinteger(Y1)     
        Y1 = double(Y1);
        Y2 = double(Y2);
    end

    MSE = sum(power(Y1(:) - Y2(:), 2))/numel(Y1);    
end