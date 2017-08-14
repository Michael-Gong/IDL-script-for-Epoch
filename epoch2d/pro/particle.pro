pro particle,n,px_min,x_min
m0        =     9.10938291d-31  ; kg
v0        =     2.99792458d8    ; m/s^2
a=getdata(n,/px_electron,/py_electron,/pz_electron,/grid_electron,/weight_electron)
pxx=a.px_electron/(m0*v0)
pyy=a.py_electron/(m0*v0)
pzz=a.pz_electron/(m0*v0)
xx=a.grid_electron.x/1e-6
yy=a.grid_electron.y/1e-6
ww=a.weight_electron
a=size(xx)
for i=0,a[1]-1 do begin
if pxx[i] gt px_min and xx[i] gt x_min then begin
px=pxx[i]
py=pyy[i]
pz=pzz[i]
x=xx[i]
y=yy[i]
w=ww[i]
j=i
break
endif
endfor
for i=j+1,a[1]-1 do begin
if pxx[i] gt px_min and xx[i] gt x_min then begin
px=[px,pxx[i]]
py=[py,pyy[i]]
pz=[pz,pzz[i]]
x=[x,xx[i]]
y=[y,yy[i]]
w=[w,ww[i]]
print,i
endif
endfor 
save,px,py,pz,x,y,w,filename='./sav/particle-'+strtrim(string(n),2)+'.sav'
end
