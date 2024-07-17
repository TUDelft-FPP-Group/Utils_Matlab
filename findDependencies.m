function names = findDependencies(fileList)
% Returns the MATLAB products necessary to execute the indicated files
%   An arbitrary number of input files can be provided in the form of
%   individual names or regular expressions. The latter make it possible to
%   analyze the dependencies of multiple file and/or file types, in different
%   folders and subfolders, at the same time.
%
%   The list of dependencies is returned as a workspace variable
%
% Inputs:
%   fileList: string array of file paths or regular expressions
%
% Outputs:
%   names: string arrat of MATLAB product names
%
% Examples:
%   >> names = findDependencies("myFile.m")
%   >> names = findDependencies("myFol\*.m")
%   >> names = findDependencies("myFol\*.m")
%   >> names = findDependencies(["myFol\*.m";"myFol\**\*.mlx"])
% 
% See also: writeDependencies, readDependencies, isDependencyInstalled
%
%% Argument validation
arguments (Input)
	fileList (:,1) string
end
arguments (Output)
	names (:,1) string
end

%% Main
files = cellfun(@(x) string({dir(x).name}), fileList, "UniformOutput", false);
namesCell = dependencies.toolboxDependencyAnalysis([files{:}]);
names = string(namesCell)';

end