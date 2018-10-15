pro chaosc
  a0=600/sqrt(2)
  set=0
  x=findgen(400)/400
  p=findgen(1200)*a0/300/(set+1)-600*a0/300/(set+1)
  g=dblarr(400,1200)
  dx=dblarr(400,1200)
  dp=dblarr(400,1200)
  t0=findgen(40)/40
  px=p
  for k=0,10,5 do begin
    t=t0[k]
    ez= 2*a0*cos(2*!pi*x)*sin(2*!pi*t)
    ey=-2*a0*cos(2*!pi*x)*cos(2*!pi*t)
    by= 2*a0*sin(2*!pi*x)*cos(2*!pi*t)
    bz=-2*a0*sin(2*!pi*x)*sin(2*!pi*t)
    py= 2*a0*cos(2*!pi*x)*sin(2*!pi*t)
    pz= 2*a0*cos(2*!pi*x)*cos(2*!pi*t)
    fr=dblarr(400,1200)
    for j=0,1199 do begin
      for i=0,399 do begin
        g[i,j]=sqrt(1+p[j]^2+(2*a0*cos(2*!pi*x[i])*cos(2*!pi*t))^2+(2*a0*cos(2*!pi*x[i])*sin(2*!pi*t))^2)
        fr[i,j]=1.2e-8*g[i,j]*p[j]*((bz[i]*py[i]/g[i,j]-by[i]*pz[i]/g[i,j])^2+(ey[i]-px[j]*bz[i]/g[i,j])^2+(ez[i]+px[j]*by[i]/g[i,j])^2-(ez[i]*pz[i]/g[i,j])^2-(ey[i]*py[i]/g[i,j])^2)
        dx[i,j]=p[j]/g[i,j]
        dp[i,j]=-(py[i]*bz[i]-pz[i]*by[i])/g[i,j];-fr[i,j]
        if(set eq 1) then dp[i,j]=dp[i,j]-fr[i,j]
      endfor
    endfor
    ivector,dx/max(dx),dp/max(dp),x,p,X_SUBSAMPLE=10,y_SUBSAMPLE=30,head_size=0.6,length_scale=0.7,rgb_table=25,auto_color=1,auto_range=[0,1],xrange=[0,1],yrange=[min(p),max(p)]
    ;WRITE_GIF,'chaos.gif',tvrd() ,delay_time=20,/multiple,repeat_count=0
  endfor
end
