pro theta_en
restore,'./sav/parameter.sav'
print,'Start reading theta_en distribution'
b=dblarr(phaseresolution,phaseresolution,(endtime-starttime)/interval+1,nenpol)
bx=dblarr(phaseresolution,(endtime-starttime)/interval+1,nenpol)
by=dblarr(phaseresolution,(endtime-starttime)/interval+1,nenpol)

for n=0,nenpol-1 do begin
for i=0,(endtime-starttime)/interval do begin
  f1='theta_en_'+ename[n]
  f3='grid_theta_en_'+ename[n]
  extra=create_struct(f1,1)
  a=getdata(i*interval+starttime,_extra=extra)
  a=a.(4)
  b[*,*,i,n]=a[*,*]
  extra=create_struct(f3,1)
  a=getdata(i*interval+starttime,_extra=extra)
  bx[*,i,n]=a.(4).x
  by[*,i,n]=a.(4).y

  print,'finished',n*100/nenpol+(i*interval+interval)*100/((endtime-starttime+interval)*nenpol),'%'
endfor
endfor
save,b,bx,by,filename='./sav/theta_en.sav'
print,'Reading theta_en OK !'
end
