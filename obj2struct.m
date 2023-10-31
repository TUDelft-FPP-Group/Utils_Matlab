function S = obj2struct(obj, layer)

    if nargin == 1
        layer = 0;
    end
    
    for j = length(obj):-1:1
        s = struct(obj(j));

        fields = fieldnames(s);
        for i = 1:length(fields)
            Ssub = s.(fields{i});
            if isobject(Ssub)
                try
                    s.(fields{i}) = obj2struct(Ssub, layer + 1);
                catch
                end
            end
        end
        S(j) = s;
    end
end