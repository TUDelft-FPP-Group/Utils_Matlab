function names = readDependencies(file)
% Read the names of required MATLAB products from a text file, which was written using the `writeDependencies()` function
%
% Inputs:
%   file: string with the rel. path of the file to read the dependencies from
%
% Outputs:
%   names: string array of MATLAB product names
%
% Examples:
%   >> names = readDependencies("dependencies.txt")
%
% See also: writeDependencies, findDependencies, isDependencyInstalled
%
%% Argument validation
arguments (Input)
    file (1,1) string
end
arguments (Output)
    names (:,1) string
end

%% Main
fid = fopen(file, "r");
productList = textscan(fid, "%s", HeaderLines=4, Delimiter="\n");
names = string([productList{:}]);
fclose(fid);
end