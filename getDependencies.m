function deps = getDependencies(fileList, printFile)
% Returns the MATLAB products necessary to execute the indicated files, and
% optionally prints them to file
%   An arbitrary number of input files can be provided in the form of
%   individual names or regular expressions. The latter make it possible to
%   analyze the dependencies of multiple file and/or file types, in different
%   folders and subfolders, at the same time.
%
%   The list of dependencies is returned as a workspace variable and is
%   optinally printed in the indicated text file, together with the MATLAB
%   version used to run the current function.

% Inputs:
%   fileList: string array of file names or regular expressions
%   printFile: string with the rel. path of the file to print the dependencies
%
% Outputs:
%   deps: string array of MATLAB products necessary to execute the input files
%
% Examples:
%   deps = getDependencies("myFile.m")
%   deps = getDependencies("myFol\*.m")
%   deps = getDependencies("myFol\*.m", "dependencies.txt")
%   deps = getDependencies(["myFol\*.m";"myFol\**\*.mlx"], "dependencies.txt",)

arguments
    fileList (:,1) string   % array of strings, gets transformed to column
    printFile string = string.empty   % rel.path of print file, optional
end

%% Find toolbox dependencies
files = cellfun(@(x) string({dir(x).name}), fileList, "UniformOutput", false);
depsCell = dependencies.toolboxDependencyAnalysis([files{:}]);
deps = string(depsCell)';

%% Output to file
if ~isempty(printFile)
    mlVersion = version;
    fid = fopen(fullfile(pwd, printFile), "w");
    fprintf(fid, "MATLAB Version:\n \t%s\n\n", mlVersion);
    fprintf(fid, "Dependencies:\n");
    fprintf(fid, "\t%s\n", deps);
    fclose(fid);
end
end