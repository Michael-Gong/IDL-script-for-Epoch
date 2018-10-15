; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro ratio2,n,part1,part2,macro1,macro2,sum1,sum2

print,'Start calculate energy  transformation ratio'
a=getdata(n,/en_electron,/grid_en_electron,/en_proton,/grid_en_proton,/en_photon,/grid_en_photon)
print,'#####################################'
print,'#####################################'


print,'electron energy transformation ratio'
numelectron  = a.en_electron
enelectron   = a.grid_en_electron.x
eenergy   = total(numelectron*enelectron)/part1*sum1/macro1
eaverage  = total(numelectron*enelectron)/total(numelectron)
enumber   = total(numelectron)/part1*sum1/macro1
print,'energy of electron is ',eenergy,'Joule'
print,'average energy of electron is ',eaverage/1.60e-13,'MeV'
print,'number of electron is ',enumber
print,'#####################################'
print,'#####################################'


print,'ion energy transformation ratio'
numproton  = a.en_proton
enproton   = a.grid_en_proton.x
protonenergy   = total(numproton*enproton)/part2*sum2/macro2
protonaverage  = total(numproton*enproton)/total(numproton)
protonnumber   = total(numproton)/part2*sum2/macro2
print,'energy of ion is ',protonenergy,'Joule'
print,'average energy of ion is ',protonaverage/1.60e-13,'MeV'
print,'number of ion is ',protonnumber
print,'#####################################'
print,'#####################################'


print,'photon energy transformation ratio'
numphoton    = a.en_photon
enphoton     = a.grid_en_photon.x
phenergy  = total(numphoton*enphoton)/part1*sum1/macro1
phaverage = total(numphoton*enphoton)/total(numphoton)
phnumber  = total(numphoton)/part1*sum1/macro1
print,'energy of photon is ',phenergy,'Joule'
print,'average energy of photon is ',phaverage/1.60e-13,'MeV'
print,'number of photon is ',phnumber
print,'#####################################'
print,'#####################################'


print,'positron energy transformation ratio'
numpositron  = a.en_positron
enpositron   = a.grid_en_positron.x
poenergy  = total(numpositron*enpositron)/part1*sum1/macro1
poaverage = total(numpositron*enpositron)/total(numpositron)
ponumber  = total(numpositron)/part1*sum1/macro1
print,'energy of positron is ',poenergy,'Joule'
print,'average energy of positron is ',poaverage/1.60e-13,'MeV'
print,'number of positron is ',ponumber
print,'#####################################'
print,'#####################################'


print,'ratio calculation finish,  OK !'
end 
