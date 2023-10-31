function M = vec2skew(v)
%VEC2SKEW Transform 3D vector into skew-symmetric matrix
    assert(isvector(v) && numel(v) == 3)
  M = [0       -v(3)   v(2);
       v(3)     0     -v(1);
      -v(2)     v(1)   0];
end