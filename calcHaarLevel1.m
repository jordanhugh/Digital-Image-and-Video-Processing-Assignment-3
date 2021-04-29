% This function takes as input a 2D array Y containing
% the image intensities of a picture and returns the 1-level
% Haar Transform
function H = calcHaarLevel1(Y)

    validateattributes(Y, {'numeric', 'logical'}, ...
        {'real', 'nonempty', 'nonsparse'});

    if (mod(size(Y,1),2) ~= 0)
        error('height must be multiple of 2');
    end
    if (mod(size(Y,2),2) ~= 0)
        error('width must be multiple of 2');
    end

    hx = size(Y,2)/2;
    hy = size(Y,1)/2;    
    
    a = Y(1:2:end, 1:2:end);
    b = Y(1:2:end, 2:2:end);
    c = Y(2:2:end, 1:2:end);
    d = Y(2:2:end, 2:2:end);
    
    lolo = (a+b+c+d)/2;
    hilo = (a+b-c-d)/2;
    lohi = (a-b+c-d)/2;
    hihi = (a-b-c+d)/2; 
    
    H = zeros(size(Y));
    
    H(1:hy, 1:hx) = lolo;
    H(hy + (1:hy), 1:hx) = hilo;
    H(1:hy, hx + (1:hx)) = lohi;
    H(hy + (1:hy), hx + (1:hx)) = hihi;

end