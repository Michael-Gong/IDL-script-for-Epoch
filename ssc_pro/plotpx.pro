pro plotpx
  a0 =findgen(8)*50+50
  restore,'pxtheta_a.sav'
  q = 0 ; 1 denotes the qed and 0 indicates the radiation reaction
  
  sss=['+','triangle','square','circle']
  ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]
  restore,'px_a.sav'
  if (q gt 0) then begin
    px_a = px_a[*,*,8:15]
    px_b = px_b[*,*,8:15]
  endif else begin
    px_a = px_a[*,*,0:7]
    px_b = px_b[*,*,0:7]
  endelse

  for i=0,3 do begin
    for j=0,3 do begin
      iplot,a0,px_a[i,j,*],linestyle=6,color=ccc[*,i],symbol=sss[j],$
        sym_thick=5,sym_size=3,/overplot,/ylog;,xrange=[0,450],yrange=[10,1200]
    endfor
  endfor

end