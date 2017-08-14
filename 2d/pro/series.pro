; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; part  : the single number in the en_electron etc
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro series,start,stop,part1,macro1,sum1,part2,macro2,sum2
electronenergy = dblarr(stop-start+1)
ionenergy      = dblarr(stop-start+1)
photonenergy   = dblarr(stop-start+1)
laserenergy    = dblarr(stop-start+1)

for i=start,stop do begin 

;print,'Start calculate energy  transformation ratio'
a=getdata(i,/en_electron,/grid_en_electron,/en_proton,/grid_en_proton,/en_photon,/grid_en_photon);,/en_positron,/grid_en_positron)
;print,'#####################################'
;print,'#####################################'


;print,'electron energy transformation ratio'
numelectron  = a.en_electron
enelectron   = a.grid_en_electron.x
eenergy   = total(numelectron*enelectron)/part1*sum1/macro1
eaverage  = total(numelectron*enelectron)/total(numelectron)
enumber   = total(numelectron)/part1*sum1/macro1
;print,'energy of electron is ',eenergy,'Joule'
;print,'average energy of electron is ',eaverage/1.60e-13,'MeV'
;print,'number of electron is ',enumber
;print,'#####################################'
;print,'#####################################'

numion       = a.en_proton
enion        = a.grid_en_proton.x
ienergy   = total(numion*enion)/part2*sum2/macro2
iaverage  = total(numion*enion)/total(numion)
inumber   = total(numion)/part2*sum2/macro2
;print,'photon energy transformation ratio'
numphoton    = a.en_photon
enphoton     = a.grid_en_photon.x
phenergy  = total(numphoton*enphoton)/part1*sum1/macro1
phaverage = total(numphoton*enphoton)/total(numphoton)
phnumber  = total(numphoton)/part1*sum1/macro1
;print,'energy of photon is ',phenergy,'Joule'
;print,'average energy of photon is ',phaverage/1.60e-13,'MeV'
;print,'number of photon is ',phnumber
;print,'#####################################'
;print,'#####################################'
electronenergy[i-start] = eenergy
photonenergy[i-start]   = phenergy
ionenergy[i-start]      = ienergy
laserenergy[i-start]    = 22080-eenergy-phenergy-ienergy
;print,'positron energy transformation ratio'
;numpositron  = a.en_positron
;enpositron   = a.grid_en_positron.x
;poenergy  = total(numpositron*enpositron)/part*sum/macro
;poaverage = total(numpositron*enpositron)/total(numpositron)
;ponumber  = total(numpositron)/part*sum/macro
;print,'energy of positron is ',poenergy,'Joule'
;print,'average energy of positron is ',poaverage/1.60e-13,'MeV'
;print,'number of positron is ',ponumber
;print,'#####################################'
;print,'#####################################'
print,'finished',100.0*(i-start+1)/(stop-start+1),'%'
endfor
save,electronenergy,ionenergy,photonenergy,laserenergy,filename='./sav/series.sav'

print,'series.pro  finish,  OK !'
end 
