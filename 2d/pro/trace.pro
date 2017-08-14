; n: the number of particle you want to trace
; time: the point where you give the limitation
; start: start time
pro trace,n,time,start,stop
m0        =     9.10938291d-31  ; kg
v0        =     2.99792458d8    ; m/s^2
print,'Strat tracing the particles'
set_plot,'ps'
device,filename='./eps/trace_electron'+'.eps',$
   /color,set_font='Helvetica',bits_per_pixel=8,/inches,xsize=8,ysize=6,font_size=16,/tt_font


  id = dblarr(n)
  x  = dblarr(n,stop-start+1)
  y  = dblarr(n,stop-start+1)
  px = dblarr(n,stop-start+1)
  py = dblarr(n,stop-start+1)
  pz = dblarr(n,stop-start+1)
  gamma = dblarr(n,stop-start+1)
  fs = dblarr(stop-start+1)
temp     = getdata(time,/grid_electron)
tracex   = temp.grid_electron.x
tracey   = temp.grid_electron.y
t        = getdata(time,/id_electron)
traceid  = t.id_electron
tp       = getdata(time,/px_electron)
tracepx  = tp.px_electron
tp       = getdata(time,/py_electron)
tracepy  = tp.py_electron
;tp       = getdata(time,/pz_electron)
;tracepz  = tp.pz_electron


script=where((cos((tracex+tracey)*!pi*1.0e6) lt 1.0e-2) and (cos((tracey-tracex)*!pi*1.0e6) lt 1.0e-2) and (sqrt(tracex^2+tracey^2) lt 2.0e-6)); and (sqrt(tracepx^2+tracepy^2+tracepz^2)/(m0*v0) gt 100.0) and (sqrt(tracepx^2+tracepy^2+tracepz^2)/(m0*v0) lt 300.0))

id=congrid(traceid[script],n)    

for i=start, stop do begin
    t        = getdata(i,/id_electron)
    traceid  = t.id_electron
   ; fs[i-start] = t.time
    temp     = getdata(i,/grid_electron)
    tracex   = temp.grid_electron.x
    tracey   = temp.grid_electron.y
    tp       = getdata(time,/px_electron,/py_electron,/gamma_electron)
    tracepx  = tp.px_electron
   ; tp       = getdata(time,/py_electron)
    tracepy  = tp.py_electron
   ; tp       = getdata(time,/pz_electron)
   ; tracepz  = tp.pz_electron
    tracegamma = tp.gamma_electron
  for j=1, n do begin
    script   = where(traceid eq id[j-1])
    x[j-1,i-start]  =  tracex[script]
    y[j-1,i-start]  =  tracey[script]
    px[j-1,i-start] = tracepx[script]  
    py[j-1,i-start] = tracepy[script]
   ; pz[j-1,i-start] = tracepz[script]
    gamma[j-1,i-start] = tracegamma[script]
  endfor  
 print,'finished',100.0*(i-start+1)/(stop-start+1),'%' 
endfor
save,x,y,px,py,gamma,filename='./trace.sav'
print,'the data analysis is OK!!!'

for j=1, n do begin
    plot,x[j-1,*],y[j-1,*],thick=1.5,xstyle=5,ystyle=5,color=255,font=1
endfor
device,/close
end
