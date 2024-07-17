function exitFlag = writeDependencies(names, file)
% Writes the MATLAB products necessary to execute the indicated files to file
%   The list of dependencies is printed in the indicated text file, together
%   with the MATLAB version used to run the current function.
%
% Inputs:
%   names: string array of MATLAB product names
%   file: string with the rel. path of the file to print the dependencies
%
% Outputs:
%   exitFlag: boolean indicating if the file was written successfully
%
% Examples:
%   >> writeDependencies(["MATLAB", "Simulink"], "dependencies.txt")
%
% See also: findDependencies, readDependencies, isDependencyInstalled
%
%% Argument validation
arguments (Input)
    names (:,1) string
    file string = string.empty
end
arguments (Output)
    exitFlag (1,1) logical
end

%% Main
matlabVersion = version;
fid = fopen(fullfile(pwd, file), "w");
fprintf(fid, "MATLAB Version:\n \t%s\n\n", matlabVersion);
fprintf(fid, "Dependencies:\n");
fprintf(fid, "\t%s\n", names);
exitFlag = fclose(fid);

if exitFlag == 0
    fprintf("Dependencies successfully written to file %s\n", file)
elseif exitFlag == -1
    error( ...
		"mutils:writeToFile", ...
		"Error writing dependencies to file '%s'", ...
		file)
end


end