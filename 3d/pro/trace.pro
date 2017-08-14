pro trace,macro,n,start,stop
print,'Strat tracing the particles'
set_plot,'ps'
device,filename='./eps/trace_electron'+'.eps',$
   /color,set_font='Helvetica',bits_per_pixel=8,/inches,xsize=8,ysize=6,font_size=16,/tt_font


  id = dblarr(n)
  x  = dblarr(n,stop-start+1)
  y  = dblarr(n,stop-start+1)
for i=start, stop do begin
    traceid  = getdata(i,/id_electron)
    temp     = getdata(i,/grid_electron)
    tracex   = temp.x
    tracey   = trmp.y
  for j=1, n do begin
    id=where(traceid EQ macron/n*j)
    x[j-1,i-start] = tracex[id]
    y[j-1,i-start] = tracey[id]
  endfor
endfor

print,'the data analysis is OK!!!'

for j=1, n do begin
    plot,x[j-1,*],y[j-1,*],thick=1.5,xstyle=5,ystyle=5,color=255,font=1,/overplot
endfor

end
