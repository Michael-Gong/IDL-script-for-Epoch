pro RK
set=1
grid_x=5-findgen(21)*0.5
value =dblarr(21)
for i = 0,20 do begin
x=double(rotate([0.0,5-i*0.5,0.0],4))*2*!pi
t0=0
t=0
p=double(rotate([1000.0,0.0,0.0],4))
gamma=factor(p)
dt=0.01
n=50
for j=0,n*2*!pi/dt do begin
  field1=givefield(t0+j*dt,x[j,*])
  dx1=velocity(p[j,*])
  dp1=-(field1[0,*]+crossp3(dx1,field1[1,*]))
  if (set eq 1) then dp1=dp1-1.2e-8*(factor(p[j,*]))^2*dx1*(dotp(dp1,dp1,3)-(dotp(field1[0,*],dx1,3))^2)

  field2=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx1/2)
  dx2=velocity(p[j,*]+dt*dp1/2)
  dp2=-(field2[0,*]+crossp3(dx2,(field2[1,*])))
  if (set eq 1) then dp2=dp2-1.2e-8*(factor(p[j,*]+dt*dp1/2))^2*dx2*(dotp(dp2,dp2,3)-(dotp(field2[0,*],dx2,3))^2)


  field3=givefield(t0+(j+0.5)*dt,x[j,*]+dt*dx2/2)
  dx3=velocity(p[j,*]+dt*dp2/2)
  dp3=-(field3[0,*]+crossp3(dx3,(field3[1,*])))
  if (set eq 1) then dp3=dp3-1.2e-8*(factor(p[j,*]+dt*dp2/2))^2*dx3*(dotp(dp3,dp3,3)-(dotp(field3[0,*],dx3,3))^2)

  field4=givefield(t0+(j+1)*dt,x[j,*]+dt*dx3)
  dx4=velocity(p[j,*]+dt*dp3)
  dp4=-(field4[0,*]+crossp3(dx4,(field4[1,*])))
  if (set eq 1) then dp4=dp4-1.2e-8*(factor(p[j,*]+dt*dp3))^2*dx4*(dotp(dp4,dp4,3)-(dotp(field4[0,*],dx4,3))^2)

  xn=x[j,*]+dt*(dx1+dx2*2+dx3*2+dx4)/6
  pn=p[j,*]+dt*(dp1+dp2*2+dp3*2+dp4)/6
  gamman=factor(pn)
  tn=t0+(j+1)*dt
  
  t=[t,tn]
  x=[x,xn]
  p=[p,pn]
  gamma=[gamma,gamman]
  print,'finished ',(j+1.0)*100.0/(n*2*!pi/dt),'%'
endfor

x=x/(2*!pi)
t=t/(2*!pi)

iplot,x[*,0],x[*,1],thick=3,rgb_table=25,vert_colors=bytscl(t),/overplot
kkk=size(p[*,1])
theta=dblarr(kkk[1])
theta[where((p[*,0] lt 0) and (p[*,1] gt 0))]=!pi
theta[where((p[*,0] lt 0) and (p[*,1] le 0))]=-!pi
;iplot,t,(atan(p[*,1]/p[*,0])+theta)/!pi*180.0,thick=3,rgb_table=25,vert_colors=bytscl(t)
mmm=(atan(p[*,1]/p[*,0])+theta)/!pi*180.0
;iplot,t,gamma,thick=3,rgb_table=25,vert_colors=bytscl(t)
print,'theta ',mmm[-1]
value[i] = mmm[-1] 
endfor

iplot, grid_x,value/180.0*!pi
;save,x,t,p,gamma,filename='./rk.sav'

;iplot,x[*,0],x[*,1]

;iplot,x[*,0],x[*,1],xtitle='y',ytitle='z',thick=3,color='red'
;iplot,x[*,0],p[*,0],xtitle='y',ytitle='P!ly!n',thick=3,color='red'
;iplot,t,x[*,0],xtitle='t',ytitle='y',thick=3,color='red'
;iplot,congrid(p[*,1],n),congrid(p[*,0],n),xtitle='P!lz!n',ytitle='P!ly!n',linestyle=6,symbol=5,sym_size=3,color='red',/sym_filled
;iplot,x[*,2],x[*,0],thick=3;rgb_table=25,vert_colors=bytscl(t),/overplot
;iplot,((x[*,2] mod 2*!pi)+2*!pi)mod 2*!pi,p[*,2],rgb_table=39,vert_color=bytscl(t),xrange=[0,2*!pi],yrange=[-400,400],linestyle=6,symbol=4
;iplot,x[*,2]/(2*!pi),p[*,2],thick=1,rgb_table=39,vert_color=bytscl(t);,xrange=[0,1],yrange=[-1000,1000]
;iplot,congrid(((x[*,2] mod 1)+1)mod 1,n),congrid(p[*,2],n),rgb_table=39,xrange=[0,1],vert_color=bytscl(findgen(n)),linestyle=6,symbol=4
;iplot,p[*,0],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=6,symbol=4
;iplot,p[*,1],rgb_table=39,vert_color=bytscl(t),xrange=[0,1],yrange=[-800,800],linestyle=6,symbol=4
;iplot,x[*,2]/(2*!pi),p[*,0],rgb_table=39,vert_color=bytscl(t)
;iplot,((x[*,2]/(2*!pi) mod 1)+1)mod 1,p[*,1],rgb_table=39,vert_color=bytscl(t),linestyle=6,symbol=4
;;iplot,t/(2*!pi),rgb_table=39,vert_color=bytscl(t)
;for i=0,n*2*!pi/dt do begin
;  ;plot,x[0:i,2]/(2*!pi),p[0:i,2],thick=1,rgb_table=25,vert_color=bytscl(t),title='time is '+strtrim(string(i*2*!pi),2)+'$\tau$'
;  plot,x[0:i,2]/(2*!pi),p[0:i,2],xrange=[0.23,0.27],yrange=[-100,100],thick=1,title='time is '+strtrim(string(i*dt/2/!pi),2)+'T'
;  write_gif,'7_8.gif',tvrd(),delay_time=1,/multiple,repeat_count=0
;  print,'finished',100.0*i/(n*2*!pi/dt),'%'
;endfor

end
