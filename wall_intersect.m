function [x_intersect,y_intersect,wl]=wall_intersect(l1x,l1y,l2x,l2y)

wl=0;
eps=20;
%line1
x1  = l1x;  %[7.9 8.5];
y1  = l1y;  %[0.8 0.81];
%line2
x2 = l2x;   %[8.25 8.25];
y2 = l2y;   %[0 0.8];
%fit linear polynomial
p1 = polyfit(x1,y1,1);
p2 = polyfit(x2,y2,1);
%calculate intersection
x_intersect = fzero(@(x) polyval(p1-p2,x),3);
y_intersect = polyval(p1,x_intersect);
% figure(1);
% %axis([(min(min(x1),min(x2))-eps) (max(max(x1),max(x2))+eps) (min(min(y1),min(y2))-eps) (max(max(y1),max(y2))+eps)])
% line(x1,y1);
% hold on;
% line(x2,y2);
 %(y_intersect > y2(2) || y_intersect < y2(1))
 
 is_btw(y2(2),y2(1),y_intersect) 
 is_btw(x1(2),x1(1),x_intersect)
 
if is_btw(y2(2),y2(1),y_intersect) && is_btw(x1(2),x1(1),x_intersect)
    %hold off
    plot(x_intersect,y_intersect,'r*')
    wl=[l2x;l2y];            
else
    x_intersect=nan;
    y_intersect=nan;
    %hold off
end

end

