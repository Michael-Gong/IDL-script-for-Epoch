FUNCTION eta,t,x,p
  Es = 1.326e18
  field = givefield(t,x)
  fl = field[0,*]+crossp3(velocity(p),field[1,*])
  pE = dotp(velocity(p),field[0,*],3)
  eta = factor(p)/Es*sqrt(dotp(fl,fl,3)-pE^2)
  return,eta
end
