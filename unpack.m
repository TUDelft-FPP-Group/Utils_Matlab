function [varargout] = unpack(x)
% Allows the multiple assignment of values in an array-like strcture to 
% individual named variables, in a Python-like style. It differs from the 
% MATLAB function "deal" as it allows to give a user-defined name to each 
% output variable. This can be very handy for unpacking the output of a 
% function that returns multiple values in a single array, or for 
% expanding the decision vector in an optimization problem.
%
% Examples:
% [a,b,c,d] = unpack([1,2,3,4])
% [lft, top, rgt, btm] = unpack(get_param(simulink_block, "Position"));
% [x1, x2, x3] = unpack(X);
% [V,gamma,alpha] = unpack(solved_equations_of_motion)

arguments
  x {mustBeA(x, ["numeric","char","string","logical","struct","cell"])}
end

if iscolumn(x)
  x = x';
end

if iscell(x) && size(x,1) == 1
  varargout = x;
  return
else
  varargout = num2cell(x, 1:ndims(x)-1);
  return
end