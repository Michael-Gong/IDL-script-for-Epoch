pro plotwakedensity4
  loadct,39
  nx=1000
  ny=400
  a=getdata(27)
  levels=findgen(50)*(max(a.number_density_electron)-min(a.number_density_electron))/50+min(a.number_density_electron)
    icontour,congrid(a.number_density_electron[*,*],500,200),congrid(a.x,500),congrid(a.y,200),$
    levels=levels,/fill,pos=[0.1,0.1,0.4,0.45] 
  
  a=getdata(45)  
    icontour,congrid(a.number_density_electron[*,*],500,200),congrid(a.x,500),congrid(a.y,200),$
    levels=levels,/fill,pos=[0.1,0.5,0.4,0.85]  
  
  a=getdata(63)
    icontour,congrid(a.number_density_electron[*,*],500,200),congrid(a.x,500),congrid(a.y,200),$
    levels=levels,/fill,pos=[0.45,0.1,0.75,0.45] 
  
  a=getdata(99)
    icontour,congrid(a.number_density_electron[*,*],500,200),congrid(a.x,500),congrid(a.y,200),$
    levels=levels,/fill,pos=[0.45,0.5,0.75,0.85] 
  
    xx=rebin(transpose(levels),4,50)
      icontour,xx,findgen(4),levels,levels=levels,/fill,pos=[0.9,0.1,0.92,0.85],xstyle=4,ystyle=5,font=1
      axis,yaxis=1,ystyle=9,charthick=1.5,charsize=1.2,ytitle='density [m!E-3!N]',font=1
end
 
