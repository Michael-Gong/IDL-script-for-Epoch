pro roam,n1,ni,n2

electronoam=dblarr(n2-n1+1)
protonoam=dblarr(n2-n1+1)
photonoam=dblarr(n2-n1+1)
eeoam    =dblarr(n2-n1+1)
aloam    =dblarr(n2-n1+1)

totaloam=300.0^2*1.37e18*!pi*5.0^2*1.0e-8*10.0*3.3333e-15/(3.0e8*2*!pi/1.0e-6)

for i=n1,n2 do begin
print,'Start calculate oam  transformation'
if(i ge ni) then begin
a=getdata(i,/oam_electron,/grid_oam_electron,/oam_proton,/grid_oam_proton,/oam_photon,/grid_oam_photon,/oam_ee,/grid_oam_ee,/oam_al,/grid_oam_al)
endif else begin
a=getdata(i,/oam_electron,/grid_oam_electron,/oam_proton,/grid_oam_proton,/oam_ee,/grid_oam_ee,/oam_al,/grid_oam_al)
endelse

electronoam[i-n1]  = total(a.oam_electron*a.grid_oam_electron.x)
protonoam[i-n1]	   = total(a.oam_proton*a.grid_oam_proton.x)
eeoam[i-n1]	   = total(a.oam_ee*a.grid_oam_ee.x)
aloam[i-n1]        = total(a.oam_al*a.grid_oam_al.x)


if(i ge ni) then begin
photonoam[i-n1]	   = total(a.oam_photon*a.grid_oam_photon.x)
endif

endfor
save,totaloam,electronoam,protonoam,photonoam,eeoam,aloam,filename='./oam.sav'
print,'oam calculation finish,  OK !'
end 
