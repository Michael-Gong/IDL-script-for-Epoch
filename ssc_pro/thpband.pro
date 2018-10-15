pro thpband

  g1     = 503/.51
  g2     = 519/.51
  a      = 500*findgen(200)/200
  t_half = 10.0*findgen(200)/200   ;8.0 ;5.5
  h1      = dblarr(200,200)
  h2      = dblarr(200,200)
  ngrid  = 10000

  for i=0,199 do begin
    for j=0,199 do begin
      x = (-t_half[i]+(findgen(ngrid)+0.5)/ngrid*2*t_half[i])*2*!pi
      R1 = 2.0/3.0/137.0*a[j]*2*g1*a[j]/3.8e5
      R2 = 2.0/3.0/137.0*a[j]*2*g2*a[j]/3.8e5
      int = total(cos(x)^2*exp(-2*x^2/(0.75*t_half[i]*2*!pi)^2)*(max(x)-min(x))/ngrid)
      h1[i,j] = g1/(1+R1*int)
      h2[i,j] = g2/(1+R2*int)
    endfor
  endfor
  icontour,h2-h1,a,t_half,/fill,rgb_table=39
  iplot,(h2[40,*]-h1[40,*])*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,thick=5
  iplot,(h2[80,*]-h1[80,*])*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5
  iplot,(h2[120,*]-h1[120,*])*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5
  iplot,(h2[160,*]-h1[160,*])*0.51/1000.0,a^2*1.37e18/1.0e21,/ylog,/overplot,thick=5

ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]

  iplot,h2[40,*]-h1[40,*],a,thick=5,color=ccc[*,0]
  iplot,h2[80,*]-h1[80,*],a,/xlog,/overplot,thick=5,color=ccc[*,1]
  iplot,h2[120,*]-h1[120,*],a,/xlog,/overplot,thick=5,color=ccc[*,2]
  iplot,h2[160,*]-h1[160,*],a,/xlog,/overplot,thick=5,color=ccc[*,3]
end