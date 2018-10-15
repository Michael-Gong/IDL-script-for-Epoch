pro px_x
    restore,'px_xseries.sav'
    x=findgen(500)/500
    px_x=smooth(px_x,[15,15,1],/edge_truncate)
    levels=findgen(500)/500*(max(px_x)-min(px_x))+min(px_x)
    device,decomposed=1
    loadct,39
    for i=1,200 do begin
      contour,px_x[*,*,i],x/1.0e-6,px[*,*,i]/(9.1e-31*3.0e8),levels=levels,/fill,title='time is '+strtrim(string(1.0*i/20.0),2)  
      write_gif,'px_xseries.gif',tvrd(),delay_time=30,/multiple,repeat_count=0
      print,'finished',100.0*i/200,'%'
    endfor
end 