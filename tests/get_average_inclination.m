function [ avg_inclination ] = get_average_inclination(values, r)
% Calculate average inclination of a line in logarithmic scale. 
% y-coordinates of line are specified by "values"; x-coordinates of 
% "values" are considered to increase by "r" times for every following
% value.

if nargin < 2
  r = 2;
end

n = numel(values);
avg_inclination = sum(log(values(1:n-1)./values(2:n)) / log(r)) / (n-1);

end

