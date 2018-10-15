pro density
n=400
restore,'z.sav'
mm=dblarr(n)
for i=0,399 do begin
 mm[i]=value_locate(z[i,*],0.0)
endfor

dd=dblarr(400)
for i=0,399 do begin
 dd[i]=total(z[i,0:mm[i]])/(mm[i]+1)
  ;dd[i]=z[i,mm[i]]
endfor
iplot,findgen(400)/20,dd
end