function rhoa = mod1Dres(m, ab, nCam)

r = m(1:nCam);
t = m(1+nCam:2*nCam - 1);

% firt calculated data (forward modeling)
for i = 1:length(ab)
    s = ab(i);
    [g] = VES1DFWD(r,t,s);      % forward output
    rhoa(i,:) = g;          % apparent resistivity (calculated)
end
rhoa = rhoa';
