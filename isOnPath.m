function onPath = isOnPath(folders)
%ISONPATH Check if folders are on the MATLAB search path.
arguments (Input), folders (:,1) string, end
arguments (Output), onPath (:,1) logical, end

pathCell = regexp(path, pathsep, 'split'); % Get MATLAB path

onPath = false(size(folders)); % Initialize output array
for i = 1:numel(folders)
    if ispc % Windows is case-insensitiv
        onPath(i) = any(strcmpi(folders(i), pathCell));
    else
        onPath(i) = any(strcmp(folders(i), pathCell));
    end
end