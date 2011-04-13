function ebeats( )
secperday = 3600*24;
s = 1e3*mod(java.lang.System.currentTimeMillis/1000, secperday)/secperday;
fprintf(1, '@%.2f\n', s);
end
