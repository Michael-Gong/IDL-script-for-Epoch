; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro r1204,n1,ni,n2

electron = dblarr(n2-n1+1)
proton   = dblarr(n2-n1+1)
photon   = dblarr(n2-n1+1)
ee	 = dblarr(n2-n1+1)
al 	 = dblarr(n2-n1+1)

for i=n1,n2 do begin
print,'Start calculate energy  transformation ratio'
if(i ge ni) then begin
a=getdata(i,/en_electron,/grid_en_electron,/en_proton,/grid_en_proton,/en_photon,/grid_en_photon,/en_ee,/grid_en_ee,/en_al,/grid_en_al)
endif else begin
a=getdata(i,/en_electron,/grid_en_electron,/en_proton,/grid_en_proton,/en_ee,/grid_en_ee,/en_al,/grid_en_al)
endelse
print,i-n1
electron[i-n1]     = total(a.en_electron*a.grid_en_electron.x)
proton[i-n1]	   = total(a.en_proton*a.grid_en_proton.x)
ee[i-n1]	   = total(a.en_ee*a.grid_en_ee.x)
al[i-n1]	   = total(a.en_al*a.grid_en_al.x)

if(i ge ni) then begin
photon[i-n1]	   = total(a.en_photon*a.grid_en_photon.x)
endif

endfor
save,electron,proton,photon,ee,al,filename='./en.sav'
print,'en calculation finish,  OK !'
end 
