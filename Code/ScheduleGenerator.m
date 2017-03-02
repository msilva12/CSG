function S = ScheduleGenerator(P)
%%SCHEDULEGENERATOR has classes matrices input P, and returns S all
%%combinations without time conflict.
% By: Murilo Silva
% Created: 4/16/2016

%% Determine number of unique combinations
r = length(P(:,1));
c = length(P(1,:));


p = ones(r,c);

for k = 1:c
    for h = 1:r
        if(~isequal(P{h,k},[]))
            p(h,k) = height(P{h,k});
        end
    end
end

Comb = prod(prod(p));

S = cell(Comb,1);

for k = 1:c
    for h = 1:r
        if(~isequal(P{h,k},[]))
            hi = height(P{h,k});
            for g = 1:hi:Comb
                for t = 1:hi
                    S{t+g-1} = [S{t+g-1}; P{h,k}(t,:)];
                end
            end
        end
    end
end

ntc = ones(Comb,1);

for t = 1:Comb
    tbc = ismember(S{t}{:,{'Mon','Tue','Wed','Thu','Fri','Sat','Sun'}},'Y');
    for h = 1:7
        if(sum(tbc(:,h))>1)
            tbf = find(tbc(:,h));
            m = length(tbf);
            for r = 1:m-1
                tLow = datetime(S{t}{tbf(r),{'StartTime'}},'InputFormat','h:mm a');
                tHigh = datetime(S{t}{tbf(r),{'EndTime'}},'InputFormat','h:mm a');
                for n = r+1:m
                    d1 = datetime(S{t}{tbf(n),{'StartTime'}},'InputFormat','h:mm a');
                    d2 = datetime(S{t}{tbf(n),{'EndTime'}},'InputFormat','h:mm a');
                    if(isbetween(d1,tLow,tHigh)||isbetween(d2,tLow,tHigh))
                        ntc(t) = 0;
                        break
                    end
                    
                end
                if(~ntc(t))
                    break
                end
            end
        end
        if(~ntc(t))
            break
        end
    end
end

S = S(find(ntc));

end