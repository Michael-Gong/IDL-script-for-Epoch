pro sw2d
  pi=3.1415927
  t0=0.0d
  dt=0.01
  xxx=double(rotate([0.0,0.0,0.0],4))
  for ix=0,18 do begin
    gamma=100.005
    x=double(rotate([3*cos(2*pi/19*ix),0.0,3*sin(2*pi/19*ix)],4))
    p=double(rotate([-100*cos(2*pi/19*ix),0.0,-100*sin(2*pi/19*ix)],4))
    for j=0,999 do begin
      field1=swfield2d(t0+j*dt,x[j,*])
      dx1=velocity(p[j,*])
      dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))

      field2=swfield2d(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
      dx2=velocity(p[j,*]+dt*dp1/2)
      dp2=-(field2[0,*]+crossp3(dx2,(field2[1,*])))

      field3=swfield2d(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
      dx3=velocity(p[j,*]+dt*dp2/2)
      dp3=-(field3[0,*]+crossp3(dx3,(field3[1,*])))

      field4=swfield2d(t0+(j+1)*dt,x[j,*]+dt*dx3)
      dx4=velocity(p[j,*]+dt*dp3)
      dp4=-(field4[0,*]+crossp3(dx4,(field4[1,*])))

      xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
      pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6
      gamman=factor(pn)
      x=[x,xn]
      p=[p,pn]
      gamma=[gamma,gamman]
    endfor
    t=findgen(10001)*dt+t0
    iplot,x[*,0],x[*,2],rgb_table=25,vert_colors=bytscl(congrid(gamma*255/100,100)),/overplot
    ;=[xxx,xn]
  endfor
  ;iplot,xxx[*,0],xxx[*,2]
end