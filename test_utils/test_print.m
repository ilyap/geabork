function test_print(varargin)
% Print test output to non-cached stream.
if nargin < 1
  error('Not enough arguments');
end

if (is_octave())
  output_stream = 2;
else
  output_stream = 1;
end

fprintf(output_stream, varargin{1}, varargin{2:end});

end