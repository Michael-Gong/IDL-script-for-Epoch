pro hatraceso
t0=0.0
dt=0.01
xx=dblarr(501,3,280)
pp=dblarr(501,3,280)

for i=0,6 do begin
for pi=0,39 do begin
x=double(rotate([0,0,1.0*i/7],4))
p=double(rotate([0,0,50.0*pi-975],4))
gamma=factor(p)
for j=0,499 do begin
field1=givefield(t0+j*dt,x[j,*])
fl=(-(field1[0,*]+crossp3(velocity(p[j,*]),field1[1,*])))
du=1.88e-9*(fl-dotp(velocity(p[j,*]),fl,3)*velocity(p[j,*]))/(1+1.88e-9*dotp(velocity(p[j,*]),fl,3))
dx1=velocity(p[j,*])+du
dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))+crossp3(du,field1[1,*])-dx1*(factor(p[j,*]))^2*dotp(du,fl,3)

field2=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
fl=(-(field2[0,*]+crossp3(velocity(p[j,*]+dt*dp1/2),field2[1,*])))
du=1.88e-9*(fl-dotp(velocity(p[j,*]+dt*dp1/2),fl,3)*velocity(p[j,*]+dt*dp1/2))/(1+1.88e-9*dotp(velocity(p[j,*]+dt*dp1/2),fl,3))
dx2=velocity(p[j,*]+dt*dp1/2)+du
dp2=-(field2[0,*]+crossp3(dx2,field2[1,*]))+crossp3(du,field2[1,*])-dx2*(factor(p[j,*]+dt*dp1/2))^2*dotp(du,fl,3)

field3=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
fl=(-(field3[0,*]+crossp3(velocity(p[j,*]+dt*dp2/2),field3[1,*])))
du=1.88e-9*(fl-dotp(velocity(p[j,*]+dt*dp2/2),fl,3)*velocity(p[j,*]+dt*dp2/2))/(1+1.88e-9*dotp(velocity(p[j,*]+dt*dp2/2),fl,3))
dx3=velocity(p[j,*]+dt*dp2/2)+du
dp3=-(field3[0,*]+crossp3(dx3,field3[1,*]))+crossp3(du,field3[1,*])-dx3*(factor(p[j,*]+dt*dp2/2))^2*dotp(du,fl,3)

field4=givefield(t0+(j+1)*dt,x[j,*]+dt*dx3)
fl=(-(field4[0,*]+crossp3(velocity(p[j,*]+dt*dp3),field4[1,*])))
du=1.88e-9*(fl-dotp(velocity(p[j,*]+dt*dp3),fl,3)*velocity(p[j,*]+dt*dp3))/(1+1.88e-9*dotp(velocity(p[j,*]+dt*dp3),fl,3))
dx4=velocity(p[j,*]+dt*dp3)+du
dp4=-(field4[0,*]+crossp3(dx4,field4[1,*]))+crossp3(du,field4[1,*])-dx4*(factor(p[j,*]+dt*dp3))^2*dotp(du,fl,3)

xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6

x=[x,xn]
p=[p,pn]

gamman=factor(pn)
gamma=[gamma,gamman]

endfor
xx[*,*,i*40+pi]=x
pp[*,*,i*40+pi]=p
print,'finished',100.0*i/7+100.0/7*pi/40,'%'
endfor
endfor
save,xx,pp,filename='hatraceso.sav'

end

