; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; part  : the single number in the en_electron etc
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro ratio,n,part,macro,sum

print,'Start calculate energy  transformation ratio'
a=getdata(n,/en_electron,/grid_en_electron,/en_photon,/grid_en_photon,/en_positron,/grid_en_positron)
print,'#####################################'
print,'#####################################'


print,'electron energy transformation ratio'
numelectron  = a.en_electron
enelectron   = a.grid_en_electron.x
eenergy   = total(numelectron*enelectron)/part*sum/macro
eaverage  = total(numelectron*enelectron)/total(numelectron)
enumber   = total(numelectron)/part*sum/macro
print,'energy of electron is ',eenergy,'Joule'
print,'average energy of electron is ',eaverage/1.60e-13,'MeV'
print,'number of electron is ',enumber
print,'#####################################'
print,'#####################################'


print,'photon energy transformation ratio'
numphoton    = a.en_photon
enphoton     = a.grid_en_photon.x
phenergy  = total(numphoton*enphoton)*sum/macro
phaverage = total(numphoton*enphoton)/total(numphoton)
phnumber  = total(numphoton)*sum/macro
print,'energy of photon is ',phenergy,'Joule'
print,'average energy of photon is ',phaverage/1.60e-13,'MeV'
print,'number of photon is ',phnumber
print,'#####################################'
print,'#####################################'


print,'positron energy transformation ratio'
numpositron  = a.en_positron
enpositron   = a.grid_en_positron.x
poenergy  = total(numpositron*enpositron)*sum/macro
poaverage = total(numpositron*enpositron)/total(numpositron)
ponumber  = total(numpositron)*sum/macro
print,'energy of positron is ',poenergy,'Joule'
print,'average energy of positron is ',poaverage/1.60e-13,'MeV'
print,'number of positron is ',ponumber
print,'#####################################'
print,'#####################################'


print,'ratio calculation finish,  OK !'
end 
