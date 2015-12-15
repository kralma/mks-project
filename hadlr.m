

rec=[0 48];
vys=[100 100]; %60 43

l2x=[rec(1) vys(1)];
l2y=[rec(2) vys(2)];

l2o=vys;
l2d=rec;

[wls_tmp,wall_param]=get_walls();
l1x=wls_tmp(1:2,1);
l1y=wls_tmp(3:4,1);


x_reg=110;
y_reg=110;

eps=10;
figure(1);
%axis([(min(min(l1x),min(l2x))-eps) (max(max(l1x),max(l2x))+eps) (min(min(l1y),min(l2y))-eps) (max(max(l1y),max(l2y))+eps)])
axis([0-eps x_reg+eps 0-eps y_reg+eps])
line(wls_tmp(1:2,:),wls_tmp(3:4,:));
hold on;
line(l2x,l2y);
scatter(vys(1),vys(2),'rx');



for i=1:length(wls_tmp)
    l1o_tmp=wls_tmp([1 3],i)';
    l1d_tmp=wls_tmp([2 4],i)';
    [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[l2o l2d]);
    %[x_intersect,y_intersect,wl]=wall_intersect(l2x,l2y,l1x_tmp,l1y_tmp) 
    
    if ~isnan(x_intersect) && ~isnan(y_intersect)
        plot(x_intersect,y_intersect,'r*')
        %pro danou i-tou stenu utlum...
        wall_param(1:end,i)
    end
        
end
hold off
