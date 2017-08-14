pro plottheta_en
restore,'./sav/parameter.sav'
restore,'./sav/grid.sav'
restore,'./sav/theta_en.sav'
set_plot,'ps'
for n=0,nenpol-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/theta_en-'+ename[n]+'-'+strtrim(string(starttime+interval*i),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=4.5,ysize=8,font_size=16,/tt_font
!P.MULTI=[0,3]
loadct,39
levels=findgen(phalevel)*max(alog10(1+b[*,*,i,n]))/phalevel
contour,congrid(alog10(1+b[*,*,i,n]),500,500),congrid(bx[*,i,n],500)*180/pi,congrid(by[*,i,n],500)/q0,$
levels=levels,/fill,title='theta_en'+'-'+'This is'+strtrim(string(realtime[i]),2)+'fs',xtitle='theta/degree',ytitle='Energy/eV',xstyle=9,ystyle=9,pos=[0.15,0.1,0.88,0.9],charthick=1.5,charsize=1.5,font=1
xx=rebin(transpose(levels),4,phalevel)
contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.1,0.92,0.9],xstyle=4,ystyle=5
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='log N!Ie',font=1

device,/close
endfor
endfor
end
