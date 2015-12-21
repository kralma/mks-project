function isWall = isWall(pos, walls)
    
    posX = pos(1);
    posY = pos(2);

    for i=1:size(walls,2)
        wallX = walls(1:2,i);
        wallY = walls(3:4,i);
        
        sgnX = sign(wallX(2) - wallX(1));
        if(sgnX == 0) 
            sgnX = 1; 
        end
        if and(sgnX * posX >= sgnX * wallX(1), sgnX * posX <= sgnX * wallX(2))
            sgnY = sign(wallY(2) - wallY(1));
            if(sgnY == 0) 
                sgnY = 1;
            end
            if and(sgnY * posY >= sgnY * wallY(1), sgnY * posY <= sgnY * wallY(2))
                isWall = 1;
                return;
            end    
        end
    end
    isWall = 0;
end