FUNCTION velocity,p
a=factor(p)
v=dblarr(1,3)
v[0,0]=p[0]/a
v[0,1]=p[1]/a
v[0,2]=p[2]/a
return,v
end