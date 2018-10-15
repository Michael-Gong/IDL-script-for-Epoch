FUNCTION getangle,x,y
pi=3.1415927
a=acos(dotp(x,y,2)/sqrt(dotp(x,x,2)*dotp(y,y,2)))
if crossp2(x,y) lt 0 then a=-a
return,a
end