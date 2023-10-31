function obj_out = copy_obj(obj_in, obj_out)
C = metaclass(obj_in);
P = C.Properties;
for k = 1:length(P)
    if ~P{k}.Dependent
        obj_out.(P{k}.Name) = obj_in.(P{k}.Name);
    end
end
end