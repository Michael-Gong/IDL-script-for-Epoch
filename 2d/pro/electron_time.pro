pro electron_time,start,stop,interval
density=transpose(dblarr(1000))
for i=0,(stop-start)/interval do begin
    a=getdata(start+i*interval,/number_density_electron)
    a=a.number_density_electron
    d=transpose(a[*,499]+a[*,500])/2.0
    density=[density,d[0,500:1499]]
    print,'finished',100.0*(i*interval+1)/(stop-start+1),'%'
endfor
e_t=density
save,e_t,filename='./electron_time.sav'
end
