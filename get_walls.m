function [walls,wall_param,walls_outside,block,street,size_walls_block,x_room,y_room]=get_walls


%       walls=[0 1 1 1;...
%              1 1 2 2;...
%              1 1 1 2;...
%              1 2 1 2];

    block=110;
    street=15;
    x_room=22;
    y_room=25;
    
    
    
    

    %1:4 colums denotes outside walls.
    %                                         %vertikalne od 0 po celych az do 110      
       walls_b1=[0   110 0   0   0   0   0   0   0   22 22 22  44 44 44  66 66 66  88 88 88;...
              110 110 0   110 110 110 110 110 110 22 22 22  44 44 44  66 66 66  88 88 88;...
              0   0   0   110 25  30  55  80  85  0  30 85  0  30 85  0  30 85  0  30 85;...
              0   110 110 110 25  30  55  80  85  25 80 110 25 80 110 25 80 110 25  80 110];
          
       walls_b1=walls_b1+1;
    
       size_walls_block=size(walls_b1);
          
       x_pos_blok=[block+zeros(2,size(walls_b1,2));...
                    zeros(2,size(walls_b1,2))];
                
       y_pos_blok=[zeros(2,size(walls_b1,2));...
                    block+zeros(2,size(walls_b1,2))];
                
       x_pos_street=[street+zeros(2,size(walls_b1,2));...
                     zeros(2,size(walls_b1,2))];         
       
       y_pos_street=[zeros(2,size(walls_b1,2));...
                     street+zeros(2,size(walls_b1,2))];
                 

                
       %entire brutal space   
       walls=[walls_b1 (walls_b1+x_pos_blok+x_pos_street) (walls_b1+2*x_pos_blok+2*x_pos_street)...
              (walls_b1+y_pos_blok+y_pos_street) (walls_b1+y_pos_blok+y_pos_street+x_pos_blok+x_pos_street)  (walls_b1+y_pos_blok+y_pos_street+2*x_pos_blok+2*x_pos_street)...
              (walls_b1+2*y_pos_blok+2*y_pos_street) (walls_b1+2*y_pos_blok+2*y_pos_street+x_pos_blok+x_pos_street) (walls_b1+2*y_pos_blok+2*y_pos_street+2*x_pos_blok+2*x_pos_street)    ];
       
       % outside walls
       walls_outside=[ walls_b1(:,1:4) walls(:,(1:4)+size(walls_b1,2)) walls(:,(1:4)+2*size(walls_b1,2))...
                     walls(:,(1:4)+3*size(walls_b1,2)) walls(:,(1:4)+4*size(walls_b1,2)) walls(:,(1:4)+5*size(walls_b1,2))...
                    walls(:,(1:4)+6*size(walls_b1,2)) walls(:,(1:4)+7*size(walls_b1,2)) walls(:,(1:4)+8*size(walls_b1,2))];   
          
  wall_b1_param=[2   2   2   2   ones(1,size(walls_b1,2)-4);...
              10  10  10  10  6.9*ones(1,size(walls_b1,2)-4)]; 
   
     wall_param=repmat(wall_b1_param,1,9);   
end