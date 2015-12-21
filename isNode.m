function isNode = isNode(pos, nodes)
    
    for i=1:size(nodes,2)
        if (pos == nodes(:,i))
            isNode = true;
            return
        end
    end
    isNode = false;
end