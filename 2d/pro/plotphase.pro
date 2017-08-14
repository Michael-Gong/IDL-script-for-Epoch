pro plotphase
restore,'./sav/parameter.sav'
restore,'./sav/phasespace.sav'
set_plot,'ps'
for n=0,nspecie-1 do begin
for i=0,(endtime-starttime)/interval do begin
device,filename='./eps/phase-'+sname[n]+'-'+strtrim(string(starttime+interval*i),2)+'.'+filetype,$
/color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=4.5,ysize=8,font_size=16,/tt_font
!P.MULTI=[0,3]
loadct,39
;levels=findgen(phalevel)*max(alog10(1+c[*,*,i,n]))/phalevel
;contour,congrid(alog10(1+c[plotarea[2]:plotarea[3],*,i,n]),500,500),congrid(cx[plotarea[2]:plotarea[3],i,n],500)/1e-6,congrid(cy[*,i,n],500),$
;levels=levels,/fill,title='y_!9q!3',xtitle='y [!9m!3m]',ytitle='!9q!3 [radian]',xstyle=9,ystyle=9,pos=[0.15,0.1,0.88,0.43],charthick=1.5,charsize=1.5,font=1
;xx=rebin(transpose(levels),4,phalevel)
;contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.1,0.92,0.43],xstyle=4,ystyle=5
;axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='log N!Ie',font=1
levels=findgen(phalevel)*max(alog10(1+b[*,*,i,n]))/phalevel
contour,congrid(alog10(1+b[plotarea[0]:plotarea[1],*,i,n]),500,500),congrid(bx[plotarea[0]:plotarea[1],i,n],500)/1e-6,congrid(by[*,i,n],500)/(m0*v0),$
levels=levels,/fill,title='x_p!Ix',xtitle='x [!9m!3m]',ytitle='p!Ix!N [m!Ie!Nc]',xstyle=9,ystyle=9,pos=[0.15,0.55,0.88,0.87],charthick=1.5,charsize=1.5,font=1
xx=rebin(transpose(levels),4,phalevel)
contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.55,0.92,0.87],xstyle=4,ystyle=5
axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='log N!Ie',font=1
device,/close
endfor
endfor
end
