% 
% Octave version of ebeats.
% Untested in MatLab.
%

function s=ebeats();
n=gmtime(time);
s=sum(1000*[n.sec n.min n.hour]./(24*(60.^[2 1 0])))
printf("@%.2f\n", s)
end
