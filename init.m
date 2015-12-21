function init()
    % init data
    
    [wls_tmp,wall_param,wls_outsd,block,street,SWB,x_rm,y_rm]=get_walls();
    
    % reciver
    rec=[160 140];
    
    % sources
    vys=[240 330];
    
    % virtual positions
    [out_positions]=get_virtual_position(rec(1),rec(2),wls_outsd);
    
    % signal loss 
    finalLoss=startTransmition(vys', 2.4e9, wls_outsd);
    
    %out_positions=[12 12 20 20 30 30 40 40];
    % vykreslovani
    hadlr(rec,vys,finalLoss,out_positions);   %finalLoss ... matrix n x n

















end