;stage program calculate the energy conversion during the process

pro stage,n1,gap,n2,part,macro,sum
n=n2-n1+1
laser     =dblarr(n)
electron  =dblarr(n)
photon    =dblarr(n)
ion       =dblarr(n)
x         =findgen(n)+n1
print,'start calculate energy conversion'
a=getdata(4)
sumen=8.854e-12*total(a.ez^2)*40.0^3/1.0e6*1.0e-18

  for i=n1,n2 do begin 
     a=getdata(i)
     laser[i-n1]    = 8.854e-12*total(a.ez^2)*40.0^3/1.0e6*1.0e-18/sumen
     
     numelectron    = a.en_electron
     enelectron     = a.grid_en_electron.x
     electron[i-n1] = total(numelectron*enelectron)/part*sum/macro/sumen
     
     if (i ge gap) then begin
      numphoton     = a.en_photon
      enphoton      = a.grid_en_photon.x
      photon[i-n1]  = total(numphoton*enphoton)/part*sum/macro/sumen
     endif
     ion[i-n1]      = 1-laser[i-n1]-electron[i-n1]-photon[i-n1]
  endfor

  iplot,x,laser,/overplot
  iplot,x,electron,/overplot
  iplot,x,photon,/overplot
end