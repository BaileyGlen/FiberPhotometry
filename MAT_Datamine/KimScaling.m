function [reference_scaled, signal_norm] = KimScaling( signal, reference)
%KIMSCALING Summary of this function goes here
%   Detailed explanation goes here
p=polyfit(reference,signal,1);
reference_scaled=reference*p(1)+p(2);
signal_norm=signal-reference_scaled+signal(1);

end

