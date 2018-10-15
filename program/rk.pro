pro RK
ke=-0.2
kb=0.65
vg=0.99
pi=3.1415927
t0=-50d
dt=0.01
for ir=0,9 do begin
for ipsi=0,5 do begin
for iz=0,9 do begin
we=0
wb=0
wl=1
gamma=1
psi=2*pi*ipsi/6
r=double(ir)*2+2
z=5*double(iz)-25
x=double(rotate([r*cos(psi),r*sin(psi),z],4))
p=double(rotate([0,0,0],4))
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
gamman=factor(pn)
fieldn=givefield((j+1)*dt,xn)
psin=getangle(fieldn[0,*],xn)
rn=sqrt(dotp(xn,xn,2))
v=velocity(pn)
wen=crossp2(xn,v)/dotp(xn,xn,2)
wln=1-vg*v[2]
wbn=sqrt((ke+kb*v[2])/gamman)
we=[we,wen]
wl=[wl,wln]
wb=[wb,wbn]
x=[x,xn]
p=[p,pn]
gamma=[gamma,gamman]
psi=[psi,psin]
r=[r,rn]
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
iplot,congrid(x[*,2],100),congrid(x[*,0],100),congrid(x[*,1],100),rgb_table=25,vert_colors=bytscl(congrid(gamma*255/100,100)),/overplot
print,ir,ipsi,iz
endfor
endfor
endfor
end
