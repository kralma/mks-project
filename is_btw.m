function out=is_btw(up,down,val)
%determine whether a value "val" is  whithin border
%even border points

out=0;
if ((val<=up) && (val>=down))
    out=1;
end
end
