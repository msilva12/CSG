function [R D] = fclass(C,T)
%FCLASS Searches T and compares it to C, returns matched row R.
%   Detailed explanation goes here

h = ismember(T(:,3:4),C);
x = 1;

if(sum(h))
    for k = 1:length(h)
        if(h(k))
            R(x,:) = T(k,:);
            x = x+1;
        end
    end
    D = setdiff(C,R(:,3:4));
else
    R = 0;
    D = C;
end
end

