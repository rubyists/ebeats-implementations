#!/usr/bin/env perl
@g=gmtime(time);printf "@%.2f\n",((@g[2]*1000/24)+(@g[1]*1000/1440)+(@g[0]*1000/86400));
