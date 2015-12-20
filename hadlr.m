function hadlr(rec,vys,R,out_positions)
%%
% param definition 
    %rec=[300 251];             %0 48
   % vys=[100 100]; %60 43   %100 100

    l2x=[rec(1) vys(1)];
    l2y=[rec(2) vys(2)];

    l2o=vys;
    l2d=rec;

    [wls_tmp,wall_param,wls_outsd,block,street,SWB,x_rm,y_rm]=get_walls();
    l1x=wls_tmp(1:2,1);
    l1y=wls_tmp(3:4,1);

    x_reg=360;
    y_reg=360;

%%
%

    eps=10;
    figure(1);
    hold on
    axis([0-eps x_reg+eps 0-eps y_reg+eps])
    line(wls_tmp(1:2,:),wls_tmp(3:4,:));
    line(l2x,l2y);
    scatter(vys(1),vys(2),'rx');
    scatter(rec(1),rec(2),'ro');
    
    % virtual position painting
    for e=0:3
        scatter(out_positions((2*e+1)),out_positions((2*e+1)+1),'gs');
    end
    
%%
% very-beautiful space representation
    
    %figure(2);
    surf(R);
    axis xy;
    shading FLAT
    view(0,90)
    colorbar

    %outside walls painting

    for i=1:SWB(1,2):size(wls_tmp,2)
        orig=wls_tmp([1 3],i);
        rectangle('Position',[orig(1),orig(2),block,block],'LineWidth',3);
    end

    %inside walls painting
    for p=[0,block+street,2*block+2*street]
        for w=[0,block+street,2*block+2*street]
            for j=([0,30,55,85]+1)
                for k=([1:x_rm:block+1-x_rm])
                    rectangle('Position',[k+w,j+p,x_rm,y_rm],'LineWidth',1.5);      
                end
            end
        end
    end

%%
% intersection of walls and virtual semirecta between recevier and source 

    for i=1:length(wls_tmp)
        l1o_tmp=wls_tmp([1 3],i)';
        l1d_tmp=wls_tmp([2 4],i)';
        [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[l2o l2d]);
        %[x_intersect,y_intersect,wl]=wall_intersect(l2x,l2y,l1x_tmp,l1y_tmp) 

        if ~isnan(x_intersect) && ~isnan(y_intersect)
            plot(x_intersect,y_intersect,'r*');
            %pro danou i-tou stenu utlum...
            wall_param(1:end,i);
        end

    end


    hold off
end
