function [out_positions]=get_virtual_position(x_in,y_in,walls)
    
    x_in_tmp=x_in;
    y_in_tmp=y_in;
    wals_tmp=walls;
    
    out_positions=nan(1,8);
    x_intersect=nan;
    y_intersect=nan;
   
    for i=1:4
        type=i;
        
        switch type
            case 1 % heading norh
                
                while isnan(x_intersect) && isnan(y_intersect)
                    
                    for k=1:length(wals_tmp)
                        l1o_tmp=wals_tmp([1 3],k)';
                        l1d_tmp=wals_tmp([2 4],k)';
                        [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[x_in y_in x_in y_in_tmp]);
         
                        if ~isnan(x_intersect) && ~isnan(y_intersect)
                            break
                        end
                    end
  
                    y_in_tmp=y_in_tmp+1;
                end
                out_positions(1,1) = x_intersect;
                out_positions(1,2) = y_intersect + 15/2; % translate to the midle of the street
                
                x_intersect=nan;
                y_intersect=nan;
                y_in_tmp=y_in;
                
            case 2 % heading east

                while isnan(x_intersect) && isnan(y_intersect)
                    
                    for k=1:length(wals_tmp)
                        l1o_tmp=wals_tmp([1 3],k)';
                        l1d_tmp=wals_tmp([2 4],k)';
                        [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[x_in y_in  x_in_tmp y_in]);
                      
                        if ~isnan(x_intersect) && ~isnan(y_intersect)
                            break
                        end
                    end
                    
                    x_in_tmp=x_in_tmp+1;
                end
                out_positions(1,3) = x_intersect + 15/2;
                out_positions(1,4) = y_intersect;
              
                x_intersect=nan;
                y_intersect=nan;
                x_in_tmp=x_in;
                
            case 3 % heading south
                
                while isnan(x_intersect) && isnan(y_intersect)
                    
                    for k=1:length(wals_tmp)
                        l1o_tmp=wals_tmp([1 3],k)';
                        l1d_tmp=wals_tmp([2 4],k)';
                        [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[x_in y_in x_in y_in_tmp]);
                       
                        if ~isnan(x_intersect) && ~isnan(y_intersect)
                            break
                        end
                    end
                    
                    y_in_tmp=y_in_tmp-1;
                end
                out_positions(1,5) = x_intersect;
                out_positions(1,6) = y_intersect - 15/2; % translate to the midle of the street
                
                x_intersect=nan;
                y_intersect=nan; 
                y_in_tmp=y_in;
                
            case 4 % heading west               
                
                while isnan(x_intersect) && isnan(y_intersect)
                    
                    for k=1:length(wals_tmp)
                        l1o_tmp=wals_tmp([1 3],k)';
                        l1d_tmp=wals_tmp([2 4],k)';
                        [x_intersect,y_intersect]=lineSegmentIntersect([l1o_tmp l1d_tmp],[x_in y_in  x_in_tmp y_in]);                     
                        if ~isnan(x_intersect) && ~isnan(y_intersect)
                            break
                        end
                    end
                    x_in_tmp=x_in_tmp-1;
                end
                out_positions(1,7) = x_intersect - 15/2;
                out_positions(1,8) = y_intersect;
                
                x_intersect=nan;
                y_intersect=nan;
                x_in_tmp=x_in;
              
            otherwise
                disp('There is sth wrong !!');
        end  
    end       
end