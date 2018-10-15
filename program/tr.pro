pro tr
t0=0.0
dt=0.001
xx=dblarr(10001,3,125)
pp=dblarr(10001,3,125)

for i=0,124 do begin
x=double(rotate([0,0,1.0*i/501],4))
p=double(rotate([0,0,0],4))
gamma=factor(p)
for j=0,9999 do begin
field1=givefield(t0+j*dt,x[j,*])
dx1=velocity(p[j,*])
dp1=-(field1[0,*]+field1[2,*]+crossp3(dx1,field1[1,*]+field1[3,*]))

field2=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
dx2=velocity(p[j,*]+dt*dp1/2)
dp2=-(field2[0,*]+field2[2,*]+crossp3(dx2,(field2[1,*]+field2[3,*])))

field3=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
dx3=velocity(p[j,*]+dt*dp2/2)
dp3=-(field3[0,*]+field3[2,*]+crossp3(dx3,(field3[1,*]+field3[3,*])))

field4=givefield(t0+(j+1)*dt,x[j,*]+dt*dx3)
dx4=velocity(p[j,*]+dt*dp3)
dp4=-(field4[0,*]+field4[2,*]+crossp3(dx4,(field4[1,*]+field4[3,*])))

xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6

x=[x,xn]
p=[p,pn]

gamman=factor(pn)
gamma=[gamma,gamman]

endfor
xx[*,*,i]=x
pp[*,*,i]=p
print,'finished',100.0*i/124,'%'
endfor
save,xx,pp,filename='tr.sav'

end

