pro dphotonseries,start,stop,interval
;interval should be 1
dphoton=dblarr(1000,1000)
for i=0,(stop-start)/interval-1 do begin
    a0=getdata(start+i*interval,/number_density_photon)
    a1=getdata(start+i*interval+1,/number_density_photon)
    d=a1.number_density_photon-a0.number_density_photon
    dphoton=[[[dphoton]],[[d]]]
    print,'finished',100.0*(i*interval+1+interval)/(stop-start+1),'%'
endfor
save,dphoton,filename='./dphotonseries.sav'
end
