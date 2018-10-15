pro circular
  a0=250
  set=0
  x=double(rotate([0.3,0,0],4))
  t0=0
  ;p=double(rotate([0,0,0],4))
  p=double(rotate([0,2*a0*cos(2*!pi*x[0])*sin(2*!pi*t0),2*a0*cos(2*!pi*x[0])*cos(2*!pi*t0)],4))
  gamma=factor(p)
  dt=0.001
  for j=0,9999 do begin
    field1=ffield(t0+j*dt,x[j,*])
    dx1=velocity(p[j,*])
    dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))
    if (set eq 1) then dp1=dp1-1.2e-8*(factor(p[j,*]))^2*dx1*(dotp(dp1,dp1,3)-(dotp(field1[0,*],dx1,3))^2)

    field2=ffield(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
    dx2=velocity(p[j,*]+dt*dp1/2)
    dp2=-(field2[0,*]+crossp3(dx2,(field2[1,*])))
    if (set eq 1) then dp2=dp2-1.2e-8*(factor(p[j,*]+dt*dp1/2))^2*dx2*(dotp(dp2,dp2,3)-(dotp(field2[0,*],dx2,3))^2)


    field3=ffield(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
    dx3=velocity(p[j,*]+dt*dp2/2)
    dp3=-(field3[0,*]+crossp3(dx3,(field3[1,*])))
    if (set eq 1) then dp3=dp3-1.2e-8*(factor(p[j,*]+dt*dp2/2))^2*dx3*(dotp(dp3,dp3,3)-(dotp(field3[0,*],dx3,3))^2)

    field4=ffield(t0+(j+1)*dt,x[j,*]+dt*dx3)
    dx4=velocity(p[j,*]+dt*dp3)
    dp4=-(field4[0,*]+crossp3(dx4,(field4[1,*])))
    if (set eq 1) then dp4=dp4-1.2e-8*(factor(p[j,*]+dt*dp3))^2*dx4*(dotp(dp4,dp4,3)-(dotp(field4[0,*],dx4,3))^2)

    xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
    pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6

    gamman=factor(pn)

    x=[x,xn]
    p=[p,pn]
    gamma=[gamma,gamman]
  endfor
  t=findgen(10001)*dt+t0
  ;iplot,t,we
  ;iplot,t,wl,/overplot
  ;iplot,t,1/r^2,/overplot
  ;iplot,t,wb,/overplot
  ;iplot,t,r
  ;iplot,t,1/sqrt(wb),/overplot
  ;iplot,t,psi
  ;iplot,psi,gamma
  ;iplot,congrid(x[*,2],100),congrid(x[*,0],100),congrid(x[*,1],100),rgb_table=25,vert_colors=bytscl(congrid(gamma*255/100,100)),/overplot
  iplot,((x[*,0] mod 1)+1)mod 1,p[*,0],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=6,symbol=4
  ;iplot,congrid(((x[*,2] mod 1)+1)mod 1, 400),congrid(p[*,2],400),rgb_table=39,xrange=[0,1],vert_color=bytscl(findgen(400)),linestyle=6,symbol=4
  ;iplot,p[*,0],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=6,symbol=4
  ;iplot,p[*,1],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=6,symbol=4
  iplot,p[*,0]
  iplot,p[*,1]
  iplot,p[*,2]
  iplot,gamma
end
