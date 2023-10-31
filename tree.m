function tree(S)
% Displays tree structure of struct variable.
%
% For non-structure input, displays the class and size of the
% input and then exits.
% For structure input, displays the fields and sub-fields of the input
% in an ASCII graphical printout in the command window.
% The order of structure fields is preserved.

%% Print out the properties of the input variable
disp(' ');
disp([inputname(1) endString(S)]);

%% Call the recursive function, if necessary
if isstruct(S)
  recursor(S,0,'');
end

disp(' ');

end


function recursor(S,level,recstr)
recstr = [recstr '  |'];
fnames = fieldnames(S);

for i = 1:length(fnames)
  %% Print out the current fieldname
  % Take out the i'th field
  Ssub = S.(fnames{i});
  
  % Create the strings
  if i == length(fnames)
    % Last field in the current level
    str = [recstr ' -- ' fnames{i} endString(Ssub)];
  else
    % Not the last field in the current level
    str = [recstr ' -- ' fnames{i} endString(Ssub)];
  end
  
  % Print the output string to the command line
  disp(str);
  
  %% Determine if each field is a struct
  if isstruct(Ssub)
    recursor(Ssub, level+1, recstr);
  end
end

end


function endstr = endString(S)
  sizestr = [int2str(size(S,1)), 'x', int2str(size(S,2))];
  endstr = [':  [' sizestr '] ' class(S)];
end