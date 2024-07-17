function exitFlag = isDependencyInstalled(names)
% Check if MATLAB toolboxes are installed
%   The function returns a boolean indicating if the indicated MATLAB
%   products are installed in the current MATLAB version. The names are to be 
%	intended as they appear in the output of the "ver" command.
%
% Inputs:
%   names: string array of MATLAB product names
%
% Outputs:
%   exitFlag: boolean indicating if the toolbox is installed
%
% Examples:
%   >> isDependencyInstalled("Simulink")
%   >> isDependencyInstalled(["Aerospace Toolbox", "Curve Fitting Toolbox"])
%
% See also: ver, findDependencies, writeDependencies, readDependencies
%
%% Argument validation
arguments (Input) 
    names (:,1) string, 
end
arguments (Output) 
    exitFlag (:,1) logical, 
end

%% Main
v = ver;
exitFlag = matches(names, string({v.Name}));

end