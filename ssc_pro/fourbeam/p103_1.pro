pro p103_1
  t=0.125
  x=findgen(200)/100-1
  y=findgen(200)/100-1
  
  Ez=dblarr(200,200) ;S-polaryzed
  Bx=dblarr(200,200)
  By=dblarr(200,200)
  
  Bz=dblarr(200,200) ;P-polarized
  Ex=dblarr(200,200)
  Ey=dblarr(200,200)
  
  for i=0,199 do begin
    for j=0,199 do begin
      Ez[i,j]=sin(2*!pi*(t-x[i]))+sin(2*!pi*(t+x[i]))+sin(2*!pi*(t-y[j]))+sin(2*!pi*(t+y[j]))
      By[i,j]=-sin(2*!pi*(t-x[i]))+sin(2*!pi*(t+x[i]))
      Bx[i,j]=sin(2*!pi*(t-y[j]))-sin(2*!pi*(t+y[j]))
      
      Bz[i,j]=sin(2*!pi*(t-x[i]))+sin(2*!pi*(t+x[i]))+sin(2*!pi*(t-y[j]))+sin(2*!pi*(t+y[j]))
      Ex[i,j]=-sin(2*!pi*(t-y[j]))+sin(2*!pi*(t+y[j]))
      Ey[i,j]=sin(2*!pi*(t-x[i]))-sin(2*!pi*(t+x[i]))
    endfor
  endfor
  ivector,Bx,By,x,y
  icontour,(Bx^2+By^2),x,y,rgb_table=65,/fill
  icontour,Ez,x,y,rgb_table=25,/fill
  icontour,Ez,x,y,c_label_show=0
;  ivector,Ex,Ey,x,y
;  icontour,Bz,x,y,rgb_table=25,/fill
end