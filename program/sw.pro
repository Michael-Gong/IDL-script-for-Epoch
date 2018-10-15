pro sw
pi=3.1415927
t0=0.0d
dt=0.0008
for ix=0,20 do begin
gamma=100.005
x=double(rotate([2.0*cos(2*pi/20*ix),2.0*sin(2*pi/20*ix),0.0],4))
p=double(rotate([100*cos(2*pi/20*ix),100*cos(2*pi/20*ix),0.0],4))
for j=0,9999 do begin
field1=swfield(t0+j*dt,x[j,*])
dx1=velocity(p[j,*])
dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))

field2=swfield(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
dx2=velocity(p[j,*]+dt*dp1/2)
dp2=-(field2[0,*]+crossp3(dx2,(field2[1,*])))

field3=swfield(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
dx3=velocity(p[j,*]+dt*dp2/2)
dp3=-(field3[0,*]+crossp3(dx3,(field3[1,*])))

field4=swfield(t0+(j+1)*dt,x[j,*]+dt*dx3)
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
iplot,congrid(x[*,0],100),congrid(x[*,1],100),rgb_table=25,vert_colors=bytscl(congrid(gamma*255/100,100)),/overplot

endfor
end