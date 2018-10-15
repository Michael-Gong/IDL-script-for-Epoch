pro p103
x=findgen(400)/20-10
y=findgen(400)/20-10
z=findgen(400,400)
l=2
w=1.5
d=7
e=4
  for i=0,399 do begin
    for j=0,399 do begin
      z[i,j]=exp(-(x[i]+d)^e/l^e-(y[j])^e/w^e)*sin(2*!pi*x[i])$
            +exp(-(x[i]-d)^e/l^e-(y[j])^e/w^e)*sin(-2*!pi*x[i])$
            +exp(-(x[i])^e/w^e-(y[j]+d)^e/l^e)*sin(2*!pi*y[j])$
            +exp(-(x[i])^e/w^e-(y[j]-d)^e/l^e)*sin(-2*!pi*y[j])
    endfor
  endfor
z=abs(z)
icontour,z,x,y,rgb_table=25,/fill
end