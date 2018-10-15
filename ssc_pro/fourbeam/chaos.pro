pro chaos
a0=600.0
set=0
x=findgen(400)/400
p=findgen(1200)*a0/300/(set+1)-600*a0/300/(set+1)
g=dblarr(400,1200)
dx=dblarr(400,1200)
dp=dblarr(400,1200)
t0=findgen(40)/40
for k=0,10, 4.9 do begin
t=t0[k]
ez=2*a0*cos(2*!pi*x)*sin(2*!pi*t)
by=2*a0*sin(2*!pi*x)*cos(2*!pi*t)
fr=dblarr(400,1200)
for j=0,1199 do begin
  for i=0,399 do begin
    g[i,j]=sqrt(1+p[j]^2+(2*a0*cos(2*!pi*x[i])*cos(2*!pi*t))^2)
    fr[i,j]=1.2e-8*g[i,j]*p[j]*(((g[i,j])^2-1)/(g[i,j])^2*(by[i])^2+2*ez[i]*by[i]*p[j]/g[i,j]+(ez[i])^2*(1+(p[j])^2)/(g[i,j])^2)
    dx[i,j]=p[j]/g[i,j]
    dp[i,j]=2*a0^2*(cos(2*!pi*t))^2*sin(2*2*!pi*x[i])/g[i,j]-fr[i,j]
    if(set eq 1) then dp[i,j]=dp[i,j]-fr[i,j]
  endfor
endfor
ivector,dx/max(dx),dp/max(dp),x,p,X_SUBSAMPLE=10,y_SUBSAMPLE=30,head_size=0.6,length_scale=0.7,rgb_table=25,auto_color=1,auto_range=[0,1],xrange=[0,1],yrange=[min(p),max(p)]
;sqrt(max((dx/max(dx))^2+(dp/max(dp)))^2)],xrange=[0,1],yrange=[min(p),max(p)]
;WRITE_GIF,'chaos.gif',tvrd() ,delay_time=20,/multiple,repeat_count=0
endfor
end
