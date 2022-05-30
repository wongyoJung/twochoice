%% load data
clear all

path_directory = '/Users/user/Science/2020 ABATAR-KKJ-rawfiles/analysis-data/raw/lickdata';
% write down the directory where the lick csv files are located
files=dir([path_directory '/*.csv']); 
timeEnd= 30*60*30;
TotalLick = {};
ABtimes = {};

for f=1:length(files)
    filename=[path_directory '/' files(f).name];
    lick = readtable(filename);
    lick = table2array(lick);
    if(length(lick) > timeEnd)
        lick = lick(1:timeEnd);
    end
    A_time = find(lick==1);
    B_time = find(lick==2);
    
    ABtimes{f,1} = A_time;
    ABtimes{f,2} = B_time;
    
    lickArray = zeros(timeEnd,2);
    lickArray(A_time,1) = 1;
    lickArray(B_time,2) = 1;
    cumLick = cumsum(lickArray,1);
    timeX = [1:1:timeEnd];
    cumLick = cat(2,timeX', cumLick);
    
    
    TotalLick{f,1} = files(f).name(1:end-4);
    TotalLick{f,2} = length(A_time);
    TotalLick{f,3} = length(B_time);
    TotalLick{f,4} = cumLick;

end

y=[];
z=[];

for k=1:size(TotalLick,1)
    y=[y TotalLick{k,4}(:,2)];
    z=[z TotalLick{k,4}(:,3)];
end



%%
x=1:1:timeEnd;

figure;
shadedErrorBar(x,mean(y,2), std(y,1,2)/sqrt(size(y,2)),'lineprops',{'Color',[1.0, 0.50, 0.50]},'transparent',1);
hold on;
shadedErrorBar(x,mean(z,2), std(z,1,2)/sqrt(size(z,2)),'lineprops',{'Color',[100,150,170]/255},'transparent',1);
legend('SO','SA');
xlabel('Time(min)');
ylabel('Cummulative Lick');
xticks([0:30*60*5:timeEnd]);
xticklabels(string([0:5:timeEnd/30/60]));
xlim([0 timeEnd]);

set(gca,'TickDir','out');
ylim([0 2000]);
box off;

%% lick analysis micro dynamics

for i=1:size(TotalLick,1)
    Atime = ABtimes{i,1};
    Btime = ABtimes{i,2};
    result=LickAnal(Atime,Btime);    
    for k=1:length(result)
        Results{i,k}=result(k);
    end
    LickCountDraw(Atime,Btime,timeEnd,TotalLick{i,1});
    
end
