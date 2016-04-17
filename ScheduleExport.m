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
time{1:t} = {mat2cell(datestr(time,'HH:MM'),t,5)};
% weekday name array
name = {'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'};

% Classes
xlswrite(fname,name,1,'B1')
xlswrite(fname,time,1,'A2')



end