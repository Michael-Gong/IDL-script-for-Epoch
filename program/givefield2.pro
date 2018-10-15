FUNCTION givefield2,t,x
  field=dblarr(4,3)
  pi=3.1415927
  a0=500d/sqrt(2)
  ke=0
  kb=0
  vg=1d
  w0=6d
  z0=w0^2/2
  tau0=4d
  wz=w0*sqrt(1+(x[2]/z0)^2)
  r=sqrt(x[0]^2+x[1]^2)
  field[0,0]=a0*w0/wz*exp(-(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])^2/(2*tau0^2))*exp(-r^2/wz^2+r^4*(1/tau0)^2/(2*wz^4))*cos((1-r^2*(1/tau0)^2/wz^2)*(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])+atan(x[2]/z0))
  field[0,1]=a0*w0/wz*exp(-(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])^2/(2*tau0^2))*exp(-r^2/wz^2+r^4*(1/tau0)^2/(2*wz^4))*cos((1-r^2*(1/tau0)^2/wz^2)*(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])+atan(x[2]/z0)+pi/2)
  field[1,0]=-a0*w0/wz*exp(-(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])^2/(2*tau0^2))*exp(-r^2/wz^2+r^4*(1/tau0)^2/(2*wz^4))*cos((1-r^2*(1/tau0)^2/wz^2)*(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])+atan(x[2]/z0)+pi/2)
  field[1,1]=a0*w0/wz*exp(-(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])^2/(2*tau0^2))*exp(-r^2/wz^2+r^4*(1/tau0)^2/(2*wz^4))*cos((1-r^2*(1/tau0)^2/wz^2)*(t-(r^2)*x[2]/(2*(x[2]^2+z0^2))-x[2])+atan(x[2]/z0))
  field[2,0]=ke*x[0]
  field[2,1]=ke*x[1]
  field[3,0]=kb*x[1]
  field[3,1]=-kb*x[0]
  return,field

end