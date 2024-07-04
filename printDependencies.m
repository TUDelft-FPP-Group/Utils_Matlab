function deps = printDependencies(outFileRelPath, varargin)
% Returns the MATLAB products necessary to execute the input files
%   An arbitrary number of input files can be provided in the form of 
%   individual names or regular expressions. The latter make it possible to 
%   analyze the dependencies of multiple file and/or file types, in different 
%   folders and subfolders, at the same time. 
% 
%   The list of dependencies is returned as a workspace variable and is printed
%   in the indicated text file, together with the MATLAB version used to run 
%   the current function.

% Inputs:
%   outFileRelPath: relative path to the output file, including extension
%   varargin: cell array of strings or char vectors indicating the file names
%
% Outputs:
%   deps: string array of MATLAB products necessary to execute the input files
%
% Examples:
%   deps = printDependencies('dependencies.txt', 'myFile.m')
%   deps = printDependencies('dependencies.txt', 'myFol\*.m')
%   deps = printDependencies('dependencies.txt', 'myFol\*.m', 'myFol\**\*.mlx')


%% Find toolbox dependencies 
files = cellfun(@(x) string({dir(x).name}), varargin, 'UniformOutput', false);
depsCell = dependencies.toolboxDependencyAnalysis([files{:}]);
deps = string(depsCell)';

%% Output to file
mlVersion = version;
fid = fopen(fullfile(pwd, outFileRelPath), 'w');
fprintf(fid, 'MATLAB Version:\n \t%s\n\n', mlVersion);
fprintf(fid, 'Dependencies:\n');
fprintf(fid, '\t%s\n', deps);
fclose(fid);
end