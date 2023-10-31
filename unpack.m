function [varargout] = unpack(x)
% Allows multiple assignments in a Python-like style
% Example: [a,b,c,d] = unpack([1,2,3,4])
arguments
  x {mustBeA(x, ["double", "char", "logical", "struct", "cell"])}
end

if iscolumn(x)
  x = x';
end

if isnumeric(x) || ischar(x) || islogical(x) || isstruct(x)
  dims = 1:ndims(x) - 1;
  varargout = num2cell(x,dims);
  
elseif iscell(x)
  if size(x,1) == 1
    varargout = x;
  else
    dims = 1:ndims(x) - 1;
    varargout = num2cell(x,dims);
  end
  
else
  error('Unsuitable data type');
end