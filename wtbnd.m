function out=wtbnd(faket,pvec,tinq,sig,fhd)
% code author: yzy
% date: 2021/11/24
% abstract: (faket, pvec) --> dpvec/dfaket, d^2pvec/dfaket^2, ...,
%           at tinq
%           with sig and fhd as algorithm parameters 
% algorithm ref: https://doi.org/10.1016/j.chemolab.2003.08.001.

% 1. faket is the time sampling vector with monotonic order;

% 2. pvec is the f sample vector, which should be periodic. Otherwise, some
% patch is suggested, such as linear extrapolation, etc. If an acyclic signal
% is input, the results might be wield at faket(end).

% 3. tinq is the time inquired, which should fulfil min(faket) < tinq < max(faket)

% 4. sig controls the spread of Gaussian function, which tends to a delta
% function if sig -> 0. It is suggested to be 5-10 times of the typical
% spacing of the time sampling vector.

% 5. fhd is the function handle, determine out as 
% @gaus,    --> smoothed data
% @gaus1,   --> 1-st derivative
% @gaus2,   --> 2-nd derivative

% to extend the available derivatives to n-th order, you need define n-th derivative of
% Gaussian, whose ratio to an Gaussian can be looked up at an ordinary
% mathematical handbook, or online resources such as
% http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/04%20Gaussian%20derivatives.pdf

pvect=pvec-pvec(1);

out=inptdat(sig,faket,pvect,tinq,str2func(fhd));

switch fhd
    case 'gaus'
    out=out+pvec(1);
end

end

function y=inptdat(sig,faket,pvec,tinq,fhd)
y=integral(@(t) fhd(sig,tinq-t).*interp1(faket,pvec,t),min(faket),max(faket));
end

function y=gaus(sig,t)
y=sig.^-1.*sqrt(2.*pi).^-1.*exp(-0.5.*sig.^-2.*t.^2);
end

function y=gaus1(sig,t)
y=-sig.^-2.*t.*gaus(sig,t);
end

function y=gaus2(sig,t)
y=sig.^-4.*(t.^2-sig.^2).*gaus(sig,t);
end

% function y=gaus3(sig,t)
% y=xxxxxxxxx.*gaus(sig,t);
% end