function str = capitalize(s)
 
s = string(s);
str = upper(extractBefore(s,2)) + extractAfter(s,1);

end