pro dphoton_time,start,stop,interval
;interval should be 1
density=transpose(dblarr(1000))
for i=0,(stop-start)/interval-1 do begin
    a0=getdata(start+i*interval,/number_density_photon)
    a0=a0.number_density_photon
    a1=getdata(start+i*interval+1,/number_density_photon)
    a1=a1.number_density_photon
    d=transpose(a1[*,499]+a1[*,500]-a0[*,499]-a0[*,500])/2.0
    density=[density,d]
    print,'finished',100.0*(i*interval+1+interval)/(stop-start+1),'%'
endfor
dp_t=density
save,dp_t,filename='./dphoton_time.sav'
end
