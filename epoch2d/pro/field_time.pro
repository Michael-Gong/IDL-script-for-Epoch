pro field_time,start,stop,interval
density=transpose(dblarr(1000))
for i=0,(stop-start)/interval do begin
    a=getdata(start+i*interval,/ez)
    a=a.ez
    d=transpose(a[*,499]+a[*,500])/2.0
    density=[density,d[0,500:1499]]
    print,'finished',100.0*(i*interval+1)/(stop-start+1),'%'
endfor
field_t=density
save,field_t,filename='./field_time.sav'
end
