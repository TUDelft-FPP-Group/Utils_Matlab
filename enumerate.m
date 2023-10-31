classdef enumerate < handle
  % Enumeration object to manage iterables and indices at the same time
  
  %%
  properties (SetAccess = immutable)
    iterable {...
      mustBeA(iterable, ["double", "char", "string", "logical", "cell"])}
  end
  
  %%
  properties (Dependent, SetAccess = immutable)
    indices
  end
  
  %%
  methods
    
    %%
    function obj = enumerate(iterable)
      % Create an object with the iterable and indices together
      arguments
        iterable (1,:) 
      end
      obj.iterable = iterable;
    end
    
    %%
    function indices = get.indices(obj)
      % Creates indices matching the elements in the iterable, starting from 1
      indices = 1:length(obj.iterable);
    end
    
    %%
    function [m,n] = size(obj)
      % Returns the length of the iterable
      [m,n] = size(obj.iterable);
    end
    
    %%
    function [v, i] = unpack(obj)
      % Returns the values and indices in a single call, useful before loops
      C = {obj.iterable; obj.indices};
      [v, i] = C{:};
    end
    
    %%
    function [varargout] = subsref(obj, s)
      % Implements subreference method for dot-indexing and ()-indexing
      % Examples:
      % - e(1) returns a struct with fields idx=1 and itm=obj.iterable(1) 
      % - for e = enumerate(["a","b"]), fprintf('%d, %s\n', e.idx, e.itm), end
      
      switch s(1).type
        case '.'
          if length(s) == 1
            % Implement obj.property
            varargout = {builtin('subsref', obj, s)};
          elseif length(s) == 2 && strcmp(s(2).type, '()')
            % Implement obj.method()
            [varargout{1:nargout}] = builtin('subsref', obj, s);
          end
          
        case '()'
          if length(s) == 1
            % Implement obj(index)
            out.itm = subsref(obj.iterable, s);
            out.idx = subsref(obj.indices, s);
            varargout = {out};
          end
          
        case '{}'
          error("Unsupported subscripted reference")
      end
    end
    
  end
end
