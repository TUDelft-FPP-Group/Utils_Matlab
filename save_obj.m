function S = save_obj(filename, obj, opts)
    %SAVE_OBJ Saves object in its custom class, with all properties 
    % converted to a standard struct, and to JSON file
    arguments
        filename (1,1) string
        obj
        opts.struct (1,1) = false
        opts.json (1,1) = false
    end
    filename = string(filename);

    %% Custom class
    save(filename + ".mat", "obj")

    %% Struct
    if opts.struct
        S = obj2struct(obj);
        if length(S) == 1
            save(filename + "_struct.mat", "-struct", "S")
        else
            save(filename + "_struct.mat", "S")
        end
    end

    %% JSON
    if opts.json
        S = obj2struct(obj);
        fid = fopen(filename + ".json", "w");
        fprintf(fid, '%s', jsonencode(S, PrettyPrint=true));
        fclose(fid);
    end
    
end