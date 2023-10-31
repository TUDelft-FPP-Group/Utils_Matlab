function stack = stack()
% Returns a table with function call stack names (not including this
% function itself)
arguments
end

% Get all names apart from the present function itself
funNames = {dbstack().name}';
funNames = string(funNames(~strcmp(funNames, mfilename)));

% Flip order: first called function is at (1), last is at (end)
funNames = flipud(funNames);

% Parse output
if isempty(funNames)
  stack = table();
else
  [values, idxs] = enumerate(funNames).unpack();
  stack = table(idxs', values', ...
    'VariableNames', ["order", "names"]);
end
end