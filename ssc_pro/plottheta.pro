pro plottheta
  a0 =findgen(8)*50+50
  restore,'pxtheta_a.sav'
  q = 0 ; 1 denotes the qed and 0 indicates the radiation reaction

  sss=['+','triangle','square','circle']
  ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]
  restore,'theta_a.sav'
  if (q gt 0) then begin
    theta_a = theta_a[*,*,8:15]
    theta_b = theta_b[*,*,8:15]
  endif else begin
    theta_a = theta_a[*,*,0:7]
    theta_b = theta_b[*,*,0:7]
  endelse

  for i=0,3 do begin
    for j=0,3 do begin
      iplot,a0,theta_a[i,j,*],linestyle=6,color=ccc[*,i],symbol=sss[j],sym_thick=5,sym_size=3,xrange=[0,550],yrange=[0,180],xtitle='$a_0$',ytitle='$\theta_{average}$',/overplot
    endfor
  endfor
end