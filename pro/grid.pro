pro grid
restore,'./sav/parameter.sav'
print,'Start reading grids'
realtime=dblarr((endtime-starttime)/interval+1)
x=dblarr(nx,(endtime-starttime)/interval+1)
y=dblarr(ny,(endtime-starttime)/interval+1)
for i=0,(endtime-starttime)/interval do begin
grid=getdata(i*interval+starttime,/grid)
realtime[i]=grid.time/1e-15
x[*,i]=grid.x/1e-6
y[*,i]=grid.y/1e-6
print,'finished',100*(i*interval+interval)/(endtime-starttime+interval),'%'
endfor
save,x,y,realtime,filename='./sav/grid.sav'
end
