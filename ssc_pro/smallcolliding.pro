pro smallcolliding
a   = findgen(200)/200*500
int = 3.1416*2.5
h   = 1000.0/(1+2.0/3.0/137.0*a^2*1000*2/3.8e5*int)
iplot,a,h,/ylog

end