pro plotpr,n,px,py
  m0        =     9.10938291d-31  ; kg
  v0        =     2.99792458d8    ; m/s^2
  t=findgen(18)+10
  for j=1, n do begin
    iplot,t,(sqrt(px^2+py^2))[j-1,*]/(m0*v0),rgb_table=25,vert_colors=bytscl(t),/overplot
  endfor

end