; ratio : energy transformation ration of each particles
; n     : the *sdf file the program get
; macro ; the macro partical number in theis simulation
; sum   : sum of the electron number in this simulation

pro r106,n1,n2,part1,macro1,sum1

electronrate=dblarr(n2-n1+1)
protonrate=dblarr(n2-n1+1)
photonrate=dblarr(n2-n1+1)

for i=n1,n2 do begin
print,'Start calculate energy  transformation ratio'
a=getdata(i,/en_electron,/grid_en_electron,/en_proton,/grid_en_proton,/total_particle_energy,/total_field_energy)
azc=getdata(1,/total_particle_energy,/total_field_energy)

numelectron  = a.en_electron
enelectron   = a.grid_en_electron.x
eenergy   = total(numelectron*enelectron)/part1*sum1/macro1
eaverage  = total(numelectron*enelectron)/total(numelectron)
enumber   = total(numelectron)/part1*sum1/macro1
numproton  = a.en_proton
enproton   = a.grid_en_proton.x
protonenergy   = total(numproton*enproton)/part1*sum1/macro1
protonaverage  = total(numproton*enproton)/total(numproton)
protonnumber   = total(numproton)/part1*sum1/macro1
electronrate[i-n1]=eenergy/(eenergy+protonenergy)*(a.total_particle_energy)/(a.total_field_energy+a.total_particle_energy)
protonrate[i-n1]=protonenergy/(eenergy+protonenergy)*(a.total_particle_energy)/(a.total_field_energy+a.total_particle_energy)
endfor
save,electronrate,protonrate,photonrate,filename='./rate.sav'
print,'ratio calculation finish,  OK !'
end 
