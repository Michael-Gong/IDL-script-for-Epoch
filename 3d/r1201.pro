pro r1201
en_particle=dblarr(14)
en_field=dblarr(14)
en_electron=dblarr(14)
en_photon=dblarr(14)
en_proton=dblarr(14)
for i=0,13 do begin
  a=getdata(i+1)
  en_particle[i]=a.total_particle_energy
  en_field[i]=a.total_field_energy
  en_electron[i]=total(a.en_electron*a.grid_en_electron.x)
  en_photon[i]=total(a.en_photon*a.grid_en_photon.x)
  en_proton[i]=total(a.en_proton*a.grid_en_proton.x)
endfor
save,en_particle,en_field,en_electron,en_photon,en_proton,filename='./1201.sav'
end
