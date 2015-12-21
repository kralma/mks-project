function map = startTransmition(transmitterPos, frequency, walls)

    maxStreetWidth = 15;    
    map = -1 * ones(361, 361);
    
    txPointer = transmitterPos;
    direction = [1 ; 0];
    
    while (not(isWall(txPointer,walls)))
        if and(abs(txPointer(1) - transmitterPos(1)) > maxStreetWidth, abs(txPointer(2) - transmitterPos(2)) > maxStreetWidth)
            %return to transmitter position
            txPointer = transmitterPos;
            
            %rotate direction
            direction = [-direction(2) ; direction(1)];
            
            if (direction == [1 ; 0])
                disp('No wall - no street :(');
            end
        end
        txPointer = txPointer + direction;
    end
    
    direction = -direction;
    normalDirection = [-direction(2), direction(1)];

    while (true)
        txPointer = txPointer + direction;
        map(txPointer(2), txPointer(1)) = 0;
        
        if (isWall(txPointer, walls))
            break;
        end
        
        if and(abs(txPointer(1) - transmitterPos(1)) > maxStreetWidth, abs(txPointer(2) - transmitterPos(2)) > maxStreetWidth)
            break;
        end
    end
end