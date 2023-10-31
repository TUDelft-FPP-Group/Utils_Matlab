function [subS, S] = popfields(S, fields)
% Extracts fields and values from structure to a new one
% Removes extracted fields from given structure

fields = string(fields);
fields = fields(:)';

subS = repmat(struct([]), length(S), 1);
for i = 1:length(S)
  for field = fields
    subS(i,1).(field) = S(i).(field);
  end
end

if nargout == 2
  S = rmfield(S, fields);
end

end