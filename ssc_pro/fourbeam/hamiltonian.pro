pro hamiltonian
  a=300
  x=findgen(500)/500*2*!pi
  px=findgen(600)*4-299.5*4
  H1=findgen(500,600)
  h=0    
    for i=0,499 do begin
      for j=0,599 do begin
        H1[i,j]=sqrt(1+px[j]^2+(2*a*cos(x[i]))^2)
      endfor
    endfor
;  device,decomposed=0
;  loadct,39
  l=findgen(200)/200*(max(h)-min(h))+min(h)
  icontour,H1,x/(2*!pi),px,rgb_table=20,levels=l,/fill,xrange=[0,1],yrange=[-1000,1000]
end