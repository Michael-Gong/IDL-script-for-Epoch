; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; part  : the single number in the en_electron etc
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro ratio,n,part,macro,sum

print,'Start calculate energy  transformation ratio'
a=getdata(n,/en_electron,/grid_en_electron,/en_photon,/grid_en_photon)
print,'#####################################'
print,'#####################################'


print,'electron energy transformation ratio'
numelectron  = a.en_electron
enelectron   = a.grid_en_electron.x
eenergy   = total(numelectron*enelectron)
eaverage  = total(numelectron*enelectron)/total(numelectron)
enumber   = total(numelectron)
print,'energy of electron is ',eenergy,'Joule'
print,'average energy of electron is ',eaverage/1.60e-13,'MeV'
print,'number of electron is ',enumber
print,'#####################################'
print,'#####################################'


print,'photon energy transformation ratio'
numphoton    = a.en_photon
enphoton     = a.grid_en_photon.x
phenergy  = total(numphoton*enphoton)*part
phaverage = total(numphoton*enphoton)/total(numphoton)
phnumber  = total(numphoton)*part
print,'energy of photon is ',phenergy,'Joule'
print,'average energy of photon is ',phaverage/1.60e-13,'MeV'
print,'number of photon is ',phnumber
print,'#####################################'
print,'#####################################'


print,'positron energy transformation ratio'
numpositron  = a.en_positron
enpositron   = a.grid_en_positron.x
poenergy  = total(numpositron*enpositron)/part*sum/macro
poaverage = total(numpositron*enpositron)/total(numpositron)
ponumber  = total(numpositron)/part*sum/macro
print,'energy of positron is ',poenergy,'Joule'
print,'average energy of positron is ',poaverage/1.60e-13,'MeV'
print,'number of positron is ',ponumber
print,'#####################################'
print,'#####################################'


print,'ratio calculation finish,  OK !'
end 
