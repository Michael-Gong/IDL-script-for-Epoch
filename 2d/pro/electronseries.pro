pro electronseries,start,stop,interval
density=dblarr(1000,1000)
for i=0,(stop-start)/interval do begin
    a=getdata(start+i*interval,/number_density_electron)
    a=a.number_density_electron
    density=[[[density]],[[a]]]
    print,'finished',100.0*(i*interval+1)/(stop-start+1),'%'
endfor
save,density,filename='./densityseries.sav'
end
