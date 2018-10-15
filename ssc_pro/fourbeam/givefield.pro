FUNCTION givefield,t,x
field=dblarr(4,3)
a0=400.0
w0=25.0
 field[0,1]= a0*exp(-(t+x[0]-30*2*!pi)^2/(3*2*!pi)^2)*sin(t+x[0])*exp(-(x[1])^2/(w0*2*!pi)^2)
 field[1,2]= -a0*exp(-(t+x[0]-30*2*!pi)^2/(3*2*!pi)^2)*sin(t+x[0])*exp(-(x[1])^2/(w0*2*!pi)^2)

return,field
end
