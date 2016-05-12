function ScheduleExport(S,fname)
%%SCHEDULEEXPORT has schedule combination matrices input S, and filename
%%fname. Creates Excel File with schedule combinations.
% By: Murilo Silva
% Created: 4/17/2016

% number of classes per sheet
n = height(S{1});

% number of different schedules
m = length(S);

% name of excel file
fname = [fname, '.xlsx'];

% time array
t = 1;
time(length(0:15:45)*length(800:100:2100)+1) = datetime();
for k = 800:100:2100
    for h = 0:15:45
        if(k+h<1000)
            time(t) = datetime([num2str(k+h)],'InputFormat','Hmm');
            t = t+1;
        elseif(k+h<1200)
            time(t) = datetime([num2str(k+h)],'InputFormat','HHmm');
            t = t+1;
        else
            time(t) = datetime([num2str(k+h)],'InputFormat','HHmm');
            t = t+1;
        end
    end
end
time(t) = datetime(num2str(2200),'InputFormat','HHmm');
time = datestr(time,'HH:MM PM');
% weekday name array
name = {'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'};

Schedule = cell(t+1,8,m);
for k = 1:m
    Schedule(2:end,1,k) = cellstr(time);
    Schedule(1,2:end,k) = cellstr(name);
    for c = 1:height(S{k})
        for w = 2:8
            if(~isequal(S{k}{c,12+w},{''}))
                start = datetime(S{k}{c,'StartTime'}{1},'InputFormat','h:mm a');
                endti = datetime(S{k}{c,'EndTime'}{1},'InputFormat','h:mm a');
                for t = 2:length(Schedule(:,1,k))
                    currt = datetime(time(t-1,:),'InputFormat','h:mm a');
                    if(currt>=start&&currt<=endti)
                        Schedule(t,w,k) = cellstr(strcat(cellstr(S{k}{c,'Subject'}),'  ',cellstr(S{k}{c,'CatalogNumber'}),',  ',cellstr(S{k}{c,'Section'})));
                    end
                end
            end
        end
    end
    xlswrite(fname,Schedule(:,:,k),k)
end
% % Classes




end