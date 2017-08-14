pro selenergy,n1,n2

ek1=10.0*1.6e-13
ek2=100.0*1.6e-13
ek3=1000.0*1.6e-13
f1 = dblarr(n2-n1+1)
f2 = dblarr(n2-n1+1)
f3 = dblarr(n2-n1+1)

print,'Start calculating selected energy fraction!'
for i=n1,n2 do begin
  a=getdata(i,/en_photon,/grid_en_photon)
  script1 = where(floor(a.grid_en_photon.x/ek1) ge 1) 
  script2 = where(floor(a.grid_en_photon.x/ek2) ge 1)
  script3 = where(floor(a.grid_en_photon.x/ek3) ge 1)
  sum = total(a.grid_en_photon.x*a.en_photon)
  f1[i-n1] = total(a.grid_en_photon.x[script1]*a.en_photon[script1])/sum
  f2[i-n1] = total(a.grid_en_photon.x[script2]*a.en_photon[script2])/sum
  f3[i-n1] = total(a.grid_en_photon.x[script3]*a.en_photon[script3])/sum
  print,'finished ',100*(i-n1+1)/(n2-n1+1),'%'

endfor
save,f1,f2,f3,filename='./selenergy.sav'

end
