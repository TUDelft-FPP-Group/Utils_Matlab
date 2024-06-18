function fullPath = getAbsPath(relPath)
% Get the full path of a file or folder.
arguments (Input), relPath (:,1) string, end
arguments (Output), fullPath (:,1) string, end

fullPath = strings(size(relPath));
for i = 1:numel(relPath)
    [status, info] = fileattrib(relPath(i));
    if status
        fullPath(i) = info.Name;
    end
end
end