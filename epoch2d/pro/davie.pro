pro davie,density=a,field=b,phase=c,theta_en=d,ekbar=e,energy=f
;;;;;this progress gives the parameters of the pic simulations;;;;;;
pi        =     3.1415926535897932384626d
q0        =     1.602176565d-19 ; C
m0        =     9.10938291d-31  ; kg
v0        =     2.99792458d8    ; m/s^2
kb        =     1.3806488d-23   ; J/K
mu0       =     4.0d-7 * !dpi  ; N/A^2
epsilon0  =     8.8541878176203899d-12 ; F/m
h_planck  =     6.62606957d-34 ; J s
;;;;;;;;;;;;;;;;;;;;;;;;;only edit here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;parameters of simulation;;;;;;;;;;;;;;;;;;;;;;
starttime =      5       ;;    the start time of plot in laser period      
endtime   =      29     ;;    the end time of plot   
interval  =       2    ;;    the time interval of plot
phaseresolution  = 1000            ;; resolution in fist_fn
dir       =      'Data'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore,'./sav/input.sav'
inputpara=read_ascii(dir+'/input.deck',template=input)
nn=size(inputpara.field1)
nn=nn[1]
for in=0,nn-1 do begin
  if inputpara.field1[in] eq 'nx'  then nx=inputpara.field2[in]
  if inputpara.field1[in] eq 'ny'  then ny=inputpara.field2[in]
endfor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nspecie   =      3
sname     =      strarr(nspecie)
sname[0]  =      'electron'        ;; then name of the species to plot
sname[1]  =      'carbon'
sname[2]  =      'photon'
;sname[1]  =      'positron'
;sname[1]  =      'electron1'
nfield    =      3
fname     =      strarr(nfield)
fname[0]  =      'ey'
fname[1]  =      'bz_averaged'
fname[2]  =      'ex'
nphaspace =      1
pname     =      strarr(nphaspace)
pname[0]  =      'x_px'
;pname[0]  =      'theta_en' 
nenpol    =      2
ename     =      strarr(nenpol)
ename[0]  =      'photon'
;ename[0]  =      'positron'
ename[1]  =      'electron'
;ename[2]  =      'proton'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;parameters of visulisation;;;;;;;;;;;;;;;;;;;;
filetype  =      'eps'  ;;the filetype of the output
plotarea  =     [0,nx-1,0,ny-1] ;;xmin xmax ymin ymax in cells
denlevel  =      24     ;;    the number of levels in density contour 
fielevel  =      24     ;;    the number of levels in field contour
phalevel  =      24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;the end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
save,filename='./sav/parameter.sav'
print,'_______________________________________________________'
print,'|                                                     |'   
print,'|        ######      ###  ##       ##  ###  ######### |'
print,'|       ##   ###    ####  ##      ##  ###  #########  |'
print,'|      ##     ##   ## ##  ##     ##  ###  ##          |'
print,'|     ##      ##  ##  ##  ##    ##  ###  ######       |'
print,'|    ##      ##  ##   ##  ##   ##  ###  ######        |'
print,'|   ##      ##  ## ## ##  ##  ##  ###  ##             |' 
print,'|  ##     ###  ##     ##  ## ##  ###  #########       |'
print,'| ########    ##      ##  ####  ###  ##########       |'
print,'|                                                     |'
print,'|_____________________BETA  0.7_______________________|'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;the procedures to run;;;;;;;;;;;;;;;;;;;;;;;;;;;;
grid
if keyword_set(a) then begin
density
plotdensity
endif
if keyword_set(b) then begin
field
plotfield
endif
if keyword_set(c) then begin
phasespace
plotphase
endif
if keyword_set(d) then begin
theta_en
plottheta_en
endif
if keyword_set(e) then begin
ekbar
plotekbar
endif
if keyword_set(f) then begin
energy
plotenergy
endif
print,'finished,OK'
end
