pro davie,density=ddd,field=fff,phase=ppp,energy=eee
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
starttime =      0      ;;    the start time of plot in laser period      
endtime   =      16     ;;    the end time of plot   
interval  =       1     ;;    the time interval of plot
phaseresolution  = 1000            ;; resolution in fist_fn
dir       =      'Data'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore,'./sav/input.sav'
inputpara=read_ascii(dir+'/input.deck',template=input)
nn=size(inputpara.field1)
nn=nn[1]
for in=0,nn-1 do begin
  if inputpara.field1[in] eq 'nx'  then nx=inputpara.field2[in]
endfor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nspecie   =      2
sname     =      strarr(nspecie)
sname[0]  =      'electron'        ;; then name of the species to plot
sname[1]  =      'proton'
;sname[2]  =      'electronm'
nfield    =      2
fname     =      strarr(nfield)
fname[0]  =      'ey'
fname[1]  =      'ex'
;fname[2]  =      'jx'
nphaspace =      1
pname     =      strarr(nphaspace)
pname[0]  =      'x_px'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;parameters of visulisation;;;;;;;;;;;;;;;;;;;;
filetype  =      'eps'  ;;the filetype of the output
plotarea  =     [0,nx-1] ;;xmin xmax ymin ymax in cells
denlevel  =      50     ;;    the number of levels in density contour 
fielevel  =      50     ;;    the number of levels in field contour
phalevel  =      50
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
print,'|_____________________BETA  0.6_______________________|'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;the procedures to run;;;;;;;;;;;;;;;;;;;;;;;;;;;;
grid
if keyword_set(ddd) then begin
density
plotdensity
endif
if keyword_set(fff) then begin
field
plotfield
endif
if keyword_set(ppp) then begin
phasespace
plotphase
endif
if keyword_set(eee) then begin
energy
plotenergy
endif
print,'finished,OK'
end
