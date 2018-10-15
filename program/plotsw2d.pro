pro plotsw2d
  a=1
  phi=!pi/4
  ind=findgen(20)*6
  x=findgen(120)/20.0-3
  y=findgen(120)/20.0-3
  Ez=dblarr(120,120)
  Bx=dblarr(120,120)
  By=dblarr(120,120)
  for j=0,119 do begin
    for i=0,119 do begin
      Ez[i,j]=2*a*cos(2*!pi*x[i])
      By[i,j]=-2*a*sin(2*!pi*x[i])
    endfor
  endfor
  levels=findgen(1000)/1000*(max(Ez)-min(Ez))+min(Ez)
  icontour,Ez,x,y,rgb_table=70,levels=levels,/fill,/overplot
  ivector,Bx,By,x,y,rgb_table=25

end