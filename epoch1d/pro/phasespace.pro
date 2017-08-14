pro phasespace
restore,'./sav/parameter.sav'
print,'Start reading phasespace distribution'
b=dblarr(nx,phaseresolution,(endtime-starttime)/interval+1,nspecie)
bx=dblarr(nx,(endtime-starttime)/interval+1,nspecie)
by=dblarr(phaseresolution,(endtime-starttime)/interval+1,nspecie)

for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
  f1='x_px_'+sname[n]
  f3='grid_x_px_'+sname[n]
  
  extra=create_struct(f1,1)
  a=getdata(i*interval+starttime,_extra=extra)
  a=a.(4)
  b[*,*,i,n]=a[*,*]
  
  extra=create_struct(f3,1)
  a=getdata(i*interval+starttime,_extra=extra)
  bx[*,i,n]=a.(4).x
  by[*,i,n]=a.(4).y
  
  print,'finished',n*100/nspecie+100*(i*interval+interval)/((endtime-starttime+interval)*nspecie),'%'
endfor
endfor
save,b,bx,by,filename='./sav/phasespace.sav'
print,'Reading phasespace OK !'
end
