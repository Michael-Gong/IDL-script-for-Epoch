; n: the number of particle you want to trace
; time: the point where you give the limitation
; start: start time
pro traceqed,n,time,start,stop
m0        =     9.10938291d-31  ; kg
v0        =     2.99792458d8    ; m/s^2
print,'Strat tracing the particles'
;set_plot,'ps'
;device,filename='./eps/trace_electron'+'.eps',$
;   /color,set_font='Helvetica',bits_per_pixel=8,/inches,xsize=8,ysize=6,font_size=16,/tt_font

  id = dblarr(n)
  x  = dblarr(n,stop-start+1)
  y  = dblarr(n,stop-start+1)
  px = dblarr(n,stop-start+1)
  py = dblarr(n,stop-start+1)
  pz = dblarr(n,stop-start+1)
  eta = dblarr(n,stop-start+1)
  radn= dblarr(n,stop-start+1)
  radt= dblarr(n,stop-start+1)
  gamma = dblarr(n,stop-start+1)
  fs = dblarr(stop-start+1)
  true = dblarr(n)
  
  arrayid = dblarr(10000,stop-start+1)
tp = getdata(start,/id_electron)
arrayid = tp.id_electron[where(tp.id_electron gt 0)]
for i=start, stop do begin
  tp = getdata(i,/id_electron)
  arrayid = setintersection(arrayid,tp.id_electron)
endfor


temp     = getdata(time,/grid_electron)
tracex   = temp.grid_electron.x
tracey   = temp.grid_electron.y
t        = getdata(time,/id_electron)
traceid  = t.id_electron
tp       = getdata(time,/px_electron)
tracepx  = tp.px_electron
tp       = getdata(time,/py_electron)
tracepy  = tp.py_electron
tp       = getdata(time,/gamma_electron)
tracepz  = tp.gamma_electron
tp       = getdata(time,/particle_eta_electron)
traceeta = tp.particle_eta_electron


script=where((traceid gt 1)); and (sqrt(tracepx^2+tracepy^2+tracepz^2)/(m0*v0) gt 100.0) and (sqrt(tracepx^2+tracepy^2+tracepz^2)/(m0*v0) lt 300.0))
print, size(arrayid)
id=congrid(arrayid,n)    

for i=start, stop do begin
    t        = getdata(i,/id_electron)
    traceid  = t.id_electron
   ; fs[i-start] = t.time
    temp     = getdata(i,/grid_electron)
    tracex   = temp.grid_electron.x
    tracey   = temp.grid_electron.y
    tp       = getdata(i,/px_electron,/py_electron,/pz_electron,/particle_eta_electron,/gamma_electron,/particle_radn_electron,/particle_radt_electron)
    tracepx  = tp.px_electron
    tracepy  = tp.py_electron
    tracepz  = tp.pz_electron
    tracegamma = tp.gamma_electron
    traceeta   = tp.particle_eta_electron
    traceradn  = tp.particle_radn_electron
    traceradt  = tp.particle_radt_electron
  for j=1, n do begin
    script   = where((traceid eq id[j-1]) and (id[j-1] gt 0))
    if (script lt 0) then begin
    true[j-1]=-1
    x[j-1,i-start]  =  x[j-2,i-start]
    y[j-1,i-start]  =  y[j-2,i-start]
    px[j-1,i-start] = px[j-2,i-start]
    py[j-1,i-start] = py[j-2,i-start]
    pz[j-1,i-start] = pz[j-2,i-start]
    eta[j-1,i-start] = eta[j-2,i-start]
    radn[j-1,i-start]  = radn[j-2,i-start]
    radt[j-1,i-start]  = radt[j-2,i-start]
    gamma[j-1,i-start] = gamma[j-2,i-start]
    continue
    endif
    x[j-1,i-start]  =  tracex[script]
    y[j-1,i-start]  =  tracey[script]
    px[j-1,i-start] = tracepx[script]  
    py[j-1,i-start] = tracepy[script]
    pz[j-1,i-start] = tracepz[script]
    eta[j-1,i-start] = traceeta[script]
    radn[j-1,i-start]  = traceradn[script]
    radt[j-1,i-start]  = traceradt[script]
    gamma[j-1,i-start] = tracegamma[script]
  endfor  
 print,'finished',100.0*(i-start+1)/(stop-start+1),'%' 
endfor
save,true,x,y,px,py,pz,eta,radn,radt,gamma,filename='./trace.sav'
print,'the data analysis is OK!!!'

;for j=1, n do begin
;    plot,x[j-1,*],y[j-1,*],thick=1.5,xstyle=5,ystyle=5,color=255,font=1
;endfor
;device,/close
end
