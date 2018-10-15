pro plotfield
field=dblarr(500,500)
x=dindgen(500)*100/500-50
y=0
z=dindgen(500)*200/500-100
t=10
device,decomposed=0
loadct,25
for i=0,499 do begin
  for j=0,499 do begin
    a=givefield2(t,[x[j],y,z[i]])
    field[i,j]=a[0,0]
  endfor
endfor
contour,field,z,x,/fill,levels=findgen(100)/100*(max(field)-min(field))+min(field)
end