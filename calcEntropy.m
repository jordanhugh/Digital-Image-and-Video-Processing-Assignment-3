%This function takes as input a 2D array Y containing
%the image intensities and returns the entropy.
function entropy = calcEntropy(Y)
    validateattributes(Y, {'numeric', 'logical'}, ...
        {'real', 'nonempty', 'nonsparse'});
    
    p = histcounts(Y, (0:255));
    p = p/sum(p);

    h = -p .* log2(p);
    h=(h(~isnan(h)));

    entropy = sum(h);
end