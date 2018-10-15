pro chaolp
  set=0
  a0=300.0
  ;for m=0,3 do begin
    x= 0.01;0.05*m*6.666666
    px=600;800*(sin(2*!pi*2*x[0]))
    gamma=sqrt(1+(px[0])^2+(2*a0*cos(2*!pi*x[0]))^2)
    dt=0.0
    t0=0
    for j=0,999 do begin
      dx1=px[j]/sqrt(1+(px[j])^2+(2*a0*cos(2*!pi*x[j]))^2)
      dp1=4.0*a0^2*cos(2*!pi*x[j])*sin(2*!pi*x[j])/sqrt(1+(px[j])^2+(2*a0*cos(2*!pi*x[j]))^2)
      if (set eq 1) then begin
        ez=2.0*a0*cos(2*!pi*x[j])*sin(2*!pi*(t0+j*dt))
        ey=2.0*a0*sin(2*!pi*x[j])*cos(2*!pi*(t0+j*dt))
        bz=-2.0*a0*sin(2*!pi*x[j])*sin(2*!pi*(t0+j*dt))
        by=2.0*a0*sin(2*!pi*x[j])*cos(2*!pi*(t0+j*dt))
        pz=2.0*a0*cos(2*!pi*x[j])*cos(2*!pi*(t0+j*dt))
        py=2.0*a0*cos(2*!pi*x[j])*sin(2*!pi*(t0+j*dt))
        g=sqrt(1+(px[j])^2+(2*a0*cos(2*!pi*x[j]))^2)
        dp1=dp1-1.2e-8*g*px[j]*((ez+px[j]*by/g)^2+(ey-px[j]*bz/g)^2+(py/g*bz-pz/g*by)^2-(ez*pz/g+ey*py/g)^2)
      endif

      dx2=(px[j]+dt*dp1/2)/sqrt(1+(px[j]+dt*dp1/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx1/2)))^2)
      dp2=4.0*a0^2*cos(2*!pi*(x[j]+dt*dx1/2))*sin(2*!pi*(x[j]+dt*dx1/2))/sqrt(1+(px[j]+dt*dp1/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx1/2)))^2)
      if (set eq 1) then begin
        ez=2.0*a0*cos(2*!pi*(x[j]+dt*dx1/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        ey=2.0*a0*sin(2*!pi*(x[j]+dt*dx1/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        bz=-2.0*a0*sin(2*!pi*(x[j]+dt*dx1/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        by=2.0*a0*sin(2*!pi*(x[j]+dt*dx1/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        pz=2.0*a0*cos(2*!pi*(x[j]+dt*dx1/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        py=2.0*a0*cos(2*!pi*(x[j]+dt*dx1/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        g=sqrt(1+(px[j]+dt*dp1/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx1/2)))^2)
        dp1=dp1-1.2e-8*g*(px[j]+dt*dp1/2)*((ez+(px[j]+dt*dp1/2)*by/g)^2+(ey-(px[j]+dt*dp1/2)*bz/g)^2+(py/g*bz-pz/g*by)^2-(ez*pz/g+ey*py/g)^2)
      endif

      dx3=(px[j]+dt*dp2/2)/sqrt(1+(px[j]+dt*dp2/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx2/2)))^2)
      dp3=4.0*a0^2*cos(2*!pi*(x[j]+dt*dx2/2))*sin(2*!pi*(x[j]+dt*dx2/2))/sqrt(1+(px[j]+dt*dp2/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx2/2)))^2)
      if (set eq 1) then begin
        ez=2.0*a0*cos(2*!pi*(x[j]+dt*dx2/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        ey=2.0*a0*sin(2*!pi*(x[j]+dt*dx2/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        bz=-2.0*a0*sin(2*!pi*(x[j]+dt*dx2/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        by=2.0*a0*sin(2*!pi*(x[j]+dt*dx2/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        pz=2.0*a0*cos(2*!pi*(x[j]+dt*dx2/2))*cos(2*!pi*(t0+(j+0.5)*dt))
        py=2.0*a0*cos(2*!pi*(x[j]+dt*dx2/2))*sin(2*!pi*(t0+(j+0.5)*dt))
        g=sqrt(1+(px[j]+dt*dp2/2)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx2/2)))^2)
        dp1=dp1-1.2e-8*g*(px[j]+dt*dp2/2)*((ez+(px[j]+dt*dp2/2)*by/g)^2+(ey-(px[j]+dt*dp2/2)*bz/g)^2+(py/g*bz-pz/g*by)^2-(ez*pz/g+ey*py/g)^2)
      endif

      dx4=(px[j]+dt*dp3)/sqrt(1+(px[j]+dt*dp3)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx3)))^2)
      dp4=4.0*a0^2*cos(2*!pi*(x[j]+dt*dx3))*sin(2*!pi*(x[j]+dt*dx3))/sqrt(1+(px[j]+dt*dp3)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx3)))^2)
      if (set eq 1) then begin
        ez=2.0*a0*cos(2*!pi*(x[j]+dt*dx3))*sin(2*!pi*(t0+(j+1)*dt))
        ey=2.0*a0*sin(2*!pi*(x[j]+dt*dx3))*cos(2*!pi*(t0+(j+1)*dt))
        bz=-2.0*a0*sin(2*!pi*(x[j]+dt*dx3))*sin(2*!pi*(t0+(j+1)*dt))
        by=2.0*a0*sin(2*!pi*(x[j]+dt*dx3))*cos(2*!pi*(t0+(j+1)*dt))
        pz=2.0*a0*cos(2*!pi*(x[j]+dt*dx3))*cos(2*!pi*(t0+(j+1)*dt))
        py=2.0*a0*cos(2*!pi*(x[j]+dt*dx3))*sin(2*!pi*(t0+(j+1)*dt))
        g=sqrt(1+(px[j]+dt*dp3)^2+(2*a0*cos(2*!pi*(x[j]+dt*dx3)))^2)
        dp1=dp1-1.2e-8*g*(px[j]+dt*dp3)*((ez+(px[j]+dt*dp3)*by/g)^2+(ey-(px[j]+dt*dp3)*bz/g)^2+(py/g*bz-pz/g*by)^2-(ez*pz/g+ey*py/g)^2)
      endif

      xn=x[j]+dt*(dx1+dx2*2+dx3*2+dx4)/6
      pn=px[j]+dt*(dp1+dp2*2+dp3*2+dp4)/6

      gamman=sqrt(1+(pn)^2+(2*a0*cos(2*!pi*xn))^2)

      x=[x,xn]
      px=[px,pn]
      gamma=[gamma,gamman]
    endfor
    t=findgen(1001)*dt+t0
    ;if (set eq 1) then begin
    ;iplot,((x[*] mod 1)+1)mod 1,px[*],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=0;,symbol=4
    ;endif else begin
    iplot,((x[*] mod 1)+1)mod 1,px[*],xrange=[0,1],yrange=[-1000,1000],rgb_table=39,vert_color=bytscl(t),linestyle=6,symbol=3,sym_size=2
    ;iplot,congrid(x[*],200),congrid(px[*],200),rgb_table=39,vert_color=bytscl(congrid(t,200)),/overplot
  ;endelse
  ;endfor
end