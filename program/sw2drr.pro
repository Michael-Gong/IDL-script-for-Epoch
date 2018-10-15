pro sw2drr
  pi=3.1415927
  t0=0.0d
  dt=0.01
  xxx=double(rotate([0.0,0.0,0.0],4))
  for ix=0,19 do begin
    gamma=100.005
    x=double(rotate([2*cos(2*pi/20*ix),2*sin(2*pi/20*ix),0.0],4))
    p=double(rotate([100*cos(2*pi/20*ix),100*sin(2*pi/20*ix),0.0],4))
    for j=0,999 do begin
      field1=swfield2d(t0+j*dt,x[j,*])
      du1=1.86e-9*((-field1[0,*]-crossp3(velocity(p[j,*]),field1[1,*]))-dotp(velocity(p[j,*]),(-field1[0,*]-crossp3(velocity(p[j,*]),field1[1,*])),3)*velocity(p[j,*]))/(1+1.86e-9*dotp(velocity(p[j,*]),(-field1[0,*]-crossp3(velocity(p[j,*]),field1[1,*])),3))
      dx1=velocity(p[j,*])+du1
      dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))-crossp3(du1,field1[1,*])-(factor(p[j,*]))^2*dotp(du1,(-field1[0,*]-crossp3(dx1,field1[1,*])),3)*dx1

      field2=swfield2d(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
      du2=1.86e-9*((-field2[0,*]-crossp3(velocity(p[j,*]+dt*dp1/2),field2[1,*]))-dotp(velocity(p[j,*]+dt*dp1/2),(-field2[0,*]-crossp3(velocity(p[j,*]+dt*dp1/2),field2[1,*])),3)*velocity(p[j,*]+dt*dp1/2))/(1+1.86e-9*dotp(velocity(p[j,*]+dt*dp1/2),(-field2[0,*]-crossp3(velocity(p[j,*]+dt*dp1/2),field2[1,*])),3))
      dx2=velocity(p[j,*]+dt*dp1/2)+du2
      dp2=-(field2[0,*]+crossp3(dx2,field2[1,*]))-crossp3(du2,field2[1,*])-(factor(p[j,*]+dt*dp1/2))^2*dotp(du2,-field2[0,*]-crossp3(dx2,field2[1,*]),3)*dx2

      field3=swfield2d(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
      du3=1.86e-9*((-field3[0,*]-crossp3(velocity(p[j,*]+dt*dp2/2),field3[1,*]))-dotp(velocity(p[j,*]+dt*dp2/2),(-field3[0,*]-crossp3(velocity(p[j,*]+dt*dp2/2),field3[1,*])),3)*velocity(p[j,*]+dt*dp2/2))/(1+1.86e-9*dotp(velocity(p[j,*]+dt*dp2/2),(-field3[0,*]-crossp3(velocity(p[j,*]+dt*dp2/2),field3[1,*])),3))
      dx3=velocity(p[j,*]+dt*dp2/2)+du3
      dp3=-(field3[0,*]+crossp3(dx3,field3[1,*]))-crossp3(du3,field3[1,*])-(factor(p[j,*]+dt*dp2/2))^2*dotp(du3,-field3[0,*]-crossp3(dx3,field3[1,*]),3)*dx3

      field4=swfield2d(t0+(j+1)*dt,x[j,*]+dt*dx3)
      du4=1.86e-9*((-field4[0,*]-crossp3(velocity(p[j,*]+dt*dp3),field4[1,*]))-dotp(velocity(p[j,*]+dt*dp3),(-field4[0,*]-crossp3(velocity(p[j,*]+dt*dp3),field4[1,*])),3)*velocity(p[j,*]+dt*dp3))/(1+1.86e-9*dotp(velocity(p[j,*]+dt*dp3),(-field4[0,*]-crossp3(velocity(p[j,*]+dt*dp3),field4[1,*])),3))
      dx4=velocity(p[j,*]+dt*dp3)+du4
      dp4=-(field4[0,*]+crossp3(dx4,field4[1,*]))-crossp3(du4,field4[1,*])-(factor(p[j,*]+dt*dp3))^2*dotp(du4,-field4[0,*]-crossp3(dx4,field4[1,*]),3)*dx4

      xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
      pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6
      gamman=factor(pn)
      x=[x,xn]
      p=[p,pn]
      gamma=[gamma,gamman]
     ; if j gt 0 then iplot,x[0:j,0],x[0:j,2],rgb_table=25,vert_colors=bytscl(congrid(gamma[0:j]*255/100,100)),/overplot

    endfor
    t=findgen(10001)*dt+t0
    iplot,congrid(x[*,0],100),congrid(x[*,2],100),rgb_table=25,vert_colors=bytscl(congrid(gamma*255/100,100)),/overplot
    ;=[xxx,xn]
  endfor
  ;iplot,xxx[*,0],xxx[*,2]
end