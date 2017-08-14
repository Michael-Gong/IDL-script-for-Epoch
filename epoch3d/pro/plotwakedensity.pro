pro plotwakedensity
  restore,'./sav/parameter.sav'
  restore,'./sav/grid.sav'
  restore,'./sav/density.sav'
  set_plot,'ps'
  for n=0,nspecie-1 do begin
      device,filename='./eps/density-'+sname[n]+'.'+filetype,$
        /color,set_font='Helvetica',/encapsulated,bits_per_pixel=8,/inches,xsize=8,ysize=4.5,font_size=16,/tt_font
      !P.MULTI=[0,5]
      loadct,39
      levels=findgen(denlevel)*(max(b[*,*,3,n])-min(b[*,*,3,n]))/denlevel+min(b[*,*,3,n])
      
      contour,congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],0,n],500,200),congrid(x[plotarea[0]:plotarea[1],0],500),congrid(y[plotarea[2]:plotarea[3],0],200),$
        levels=levels,/fill,pos=[0.15,0.55,0.45,0.9],charsize=1.5,charthick=1.5,font=1,ytitle='y [!9m!3m]',ystyle=9
        
      contour,congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],1,n],500,200),congrid(x[plotarea[0]:plotarea[1],1],500),congrid(y[plotarea[2]:plotarea[3],1],200),$
        levels=levels,/fill,pos=[0.5,0.55,0.8,0.9],charsize=1.5,charthick=1.5,font=1
        
      contour,congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],2,n],500,200),congrid(x[plotarea[0]:plotarea[1],2],500),congrid(y[plotarea[2]:plotarea[3],2],200),$
        levels=levels,/fill,pos=[0.15,0.15,0.45,0.5],charsize=1.5,charthick=1.5,font=1,xtitle='x [!9m!3m]',xstyle=9,ytitle='y [!9m!3m]',ystyle=9
        
      contour,congrid(b[plotarea[0]:plotarea[1],plotarea[2]:plotarea[3],3,n],500,200),congrid(x[plotarea[0]:plotarea[1],3],500),congrid(y[plotarea[2]:plotarea[3],3],200),$
        levels=levels,/fill,pos=[0.5,0.15,0.8,0.5],charsize=1.5,charthick=1.5,font=1,xtitle='x [!9m!3m]',xstyle=9
        
      
      xx=rebin(transpose(levels),4,denlevel)
      contour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.15,0.92,0.9],xstyle=4,ystyle=5,font=1
      axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='density [m!E-3!N]',font=1
      device,/close
endfor
end