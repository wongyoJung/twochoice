function [cummulLick,countA,countB] = cummulLickDraw(directory,filename,animalID)
filename=horzcat(directory,filename,'.txt');
T =readtable(filename);
select=T{:,2};

countA=find(strcmp(select,'LickA'));
countB=find(strcmp(select,'LickB'));

time=T{:,3}/1000;

cummulLick=[];
for t=0*60:3:30*60
      id=find(time<t);
    if isempty(id)
        TimeId=0;
    else
        TimeId=id(end);
    end
    LickA=length(find(strcmp(select(1:TimeId,1),'LickA')));
    LickB=length(find(strcmp(select(1:TimeId,1),'LickB')));
    cummulLick(t/3+1,1)=t;
    cummulLick(t/3+1,2)=LickA;
    cummulLick(t/3+1,3)=LickB;
end


figure;
plot(cummulLick(:,1),cummulLick(:,3),'Color',[0,0.60,0.50],'LineWidth',1.5)
% plot(cummulLick(:,1),cummulLick(:,2),'Color',[0.88,0.01,0.01],'LineWidth',1.5)
hold on;
plot(cummulLick(:,1),cummulLick(:,2),'Color',[0.88,0.01,0.01],'LineWidth',1.5)
% plot(cummulLick(:,1),cummulLick(:,3),'Color',[0,0.60,0.50],'LineWidth',1.5)
legend('Sucralose','Sucrose','Location','southeast');
xlabel('Time(s)');
ylabel('Cummulative Lick');
set(gca,'TickDir','out');
box off;

% countA=length(find(strcmp(select,'LickA')));
% countB=length(find(strcmp(select,'LickB')));
countA = LickA;
countB = LickB;
title(animalID);
end
% v = VideoReader('F:\videofile\190225_two choice_avi\0225_140742_bi4_Hab2.avi');
% nFrames = v.Duration*v.FrameRate;
% for i = 7200:10:8200
%     img = read(v,i);
%     image(img);
%     LickA=strcat('Sucrose: ' , sprintf('%d',y(i+90)));
%     LickB=strcat('Sucralose: ' , sprintf('%d',z(i+90)));
%     text1 = text(100,100,LickA);
%     text2 = text(100,100,LickB);
%     box off;
%     axis off;
% end
