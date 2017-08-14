pro plottrace,n,x,y,t
  for j=1, n do begin
    iplot,x[j-1,*]/1.0e-6,y[j-1,*]/1.0e-6,rgb_table=25,vert_colors=bytscl(t),/overplot
  endfor
  
end
