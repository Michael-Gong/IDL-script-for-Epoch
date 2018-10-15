pro colliding

g      = 1000.0
a      = 500*findgen(200)/200
t_half = 10.0*findgen(200)/200   ;8.0 ;5.5
h      = dblarr(200,200)
hq     = dblarr(200,200)
ngrid  = 10000
eta    = 2*g*a/3.8e5

for i=0,199 do begin
  for j=0,199 do begin
    x = ((findgen(ngrid)+0.5)/ngrid*2*t_half[i])*2*!pi
    R = 2.0/3.0/137.0*a[j]*2*g*a[j]/3.8e5
    Rq= 2.0/3.0/137.0*a[j]*2*g*a[j]/3.8e5*(1+18.0*eta[j]+69.0*eta[j]^2+73.0*eta[j]^3+5.806*eta[j]^4)^(-1.0/3.0)
    int = total(cos(x)^2*exp(-2*x^2/(0.75*t_half[i]*2*!pi)^2)*(max(x)-min(x))/ngrid)
;    int = total(cos(x)^2*sin(x/(t_half[i]*2*!pi))^2*(max(x)-min(x))/ngrid)
    h[i,j] = g/(1+R*int)
    hq[i,j] = g/(1+Rq*int)
  endfor
endfor
;icontour,h,a,t_half,/fill,rgb_table=39
iplot,h[179,*]*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,thick=5
;iplot,h[119,*]*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5
;iplot,h[159,*]*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5
;iplot,h[199,*]*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5

ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]

iplot,a,h[79,*],/ylog,thick=5,color=ccc[*,0]
iplot,a,h[119,*],/ylog,/overplot,thick=5,color=ccc[*,1]
iplot,a,h[159,*],/ylog,/overplot,thick=5,color=ccc[*,2]
iplot,a,h[199,*],/ylog,/overplot,thick=5,color=ccc[*,3]

iplot,a,hq[79,*],/ylog,thick=5,color=ccc[*,0],linestyle=2
iplot,a,hq[119,*],/ylog,/overplot,thick=5,color=ccc[*,1],linestyle=2
iplot,a,hq[159,*],/ylog,/overplot,thick=5,color=ccc[*,2],linestyle=2
iplot,a,hq[199,*],/ylog,/overplot,thick=5,color=ccc[*,3],linestyle=2
end