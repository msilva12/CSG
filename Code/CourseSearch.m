function [P, N] = CourseSearch(T,C)
%%COURSESEARCH has input table C and T, where C is what we search in T.
% By: Murilo Silva
% Created: 4/16/2016
% Purpose is to return table T variable which contains all the
% classes and their sections.
h = ismember(T(:,3:4),C);
x = 1;

if(sum(h))
    for k = 1:length(h)
        if(h(k))
            F(x,:) = T(k,:);
            x = x+1;
        end
    end
    N = setdiff(C,F(:,3:4));
else
    F = 0;
    N = C;
end

k = {zeros([1 height(C)])};
g = k;
for h = 1:height(C)
    k{h} = find(ismember(F{:,{'Subject'}},C{h,{'Subject'}}));
    g{h} = find(ismember(F{:,{'CatalogNumber'}},C{h,{'CatalogNumber'}}));
    k{h} = k{h}(find(ismember(k{h},g{h})));
end

for h = 1:length(k)
    K{:,1,h} = F(k{h},:);
end

uc = cell([1 length(K(:,:))]);

% h is index for different classes
for h = 1:length(K(:,:))
    
    uc{h} = unique(K{:,:,h}(:,{'Component'}));
    H{height(uc{h}),h} = 0;
    for p = 1:height(uc{h})
        H{p,h} = find(ismember(K{:,1,h}(:,{'Component'}),uc{h}(p,:)));
        P{p,h} = K{:,1,h}(H{p,h},:);
    end
end

end