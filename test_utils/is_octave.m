function [isOctave] = is_octave()
% Returns true if runs in octave (false in matlab).
isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;
return