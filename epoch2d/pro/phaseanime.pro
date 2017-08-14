pro phaseanime
restore,'./sav/parameter.sav'
for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
  f1='x_px_'+sname[n]
  f3='grid_x_px_'+sname[n]
  
  extra=create_struct(f1,1)
  a=getdata(i*interval+starttime,_extra=extra)
  a=a.(3)
  b=a  
  extra=create_struct(f3,1)
  a=getdata(i*interval+starttime,_extra=extra)
  bx=a.(3).x
  by=a.(3).y
device,decomposed=1  
!P.MULTI=[0,2]
loadct,39
levels=findgen(phalevel)*10/phalevel
contour,congrid(alog10(1+b[plotarea[0]:plotarea[1],*]),500,200),congrid(bx[plotarea[0]:plotarea[1]],500)/1e-6,congrid(by[*],200)/(m0*v0),$
levels=levels,/fill,title='x_p!Ix',xtitle='x [!9m!3m]',ytitle='p!Ix!N [m!Ie!Nc]',xstyle=9,ystyle=9,pos=[0.15,0.15,0.88,0.88],charthick=1.5,charsize=1.5,font=1
xx=rebin(transpose(levels),4,phalevel)
contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.15,0.92,0.88],xstyle=4,ystyle=5
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='log N!Ie',font=1
WRITE_GIF,'x_px.gif',tvrd() ,delay_time=0.2,/multiple,repeat_count=0
endfor
endfor
WRITE_GIF,'x_px.gif',bytscl(fltarr(500,500)),/close
end
