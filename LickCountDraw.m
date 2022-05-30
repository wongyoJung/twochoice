function[] = LickCountDraw(Atime,Btime,timeEnd,Name)
LickA=zeros(1,timeEnd);
LickB=zeros(1,timeEnd);

for k=1:length(Atime)
    LickA(Atime(k))=1;
end


for k=1:length(Btime)
    LickB(Btime(k))=1;
end
x=1:timeEnd;
    figure('Position', [10 10 800 300]);
%    stem(x,LickA*2,'Marker','none','Color',[0,0.60,0.50]) green
     stem(x,LickA*2,'Marker','none','Color',[229 146 59]/255)
    set(gca,'YTickLabel',[]);
    hold on;
%     g2=stem(x,-LickB*2,'Marker','none','Color',[0.8,0.30,0.10]);red 
    g2=stem(x,-LickB*2,'Marker','none','Color',[59 135 84]/255);
    set(gca,'TickDir','out');
    set(gca,'ytick',[]);
    set(gca,'Fontsize',15);
    legend('Sucrose','Sucralose');

%     if(STRCMP(A'SO')
%     legend('Sucrose','Sucralose','Location','northwest','Fontsize',12,'Orientation','horizontal');
%         else
%         legend('Sucralose','Sucrose','Location','northwest','Fontsize',12,'Orientation','horizontal');
%     end
    
   
%     set(lgnd,'position',[0 0 0.5 0.1]);
    title(Name,'fontsize',15);
    xlabel('Time(s)','Fontsize',15);
    
end