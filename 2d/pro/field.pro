pro field
restore,'./sav/parameter.sav'
print,'Start reading fields'
field=dblarr(nx,ny,(endtime-starttime)/interval+1,nfield)
for n=0,nfield-1 do begin
for i=0,(endtime-starttime)/interval do begin
  extra=create_struct(fname[n],1)
  a=getdata(i*interval+starttime,_extra=extra)
  a=a.(4)
  field[*,*,i,n]=a[*,*]
  print,'finished',n*100/nfield+100*(i*interval+interval)/((endtime-starttime+interval)*nfield),'%'
endfor
endfor
save,field,filename='./sav/field.sav'
print,'Reading field OK!'
end
