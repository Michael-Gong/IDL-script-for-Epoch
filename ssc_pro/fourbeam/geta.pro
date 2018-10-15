FUNCTION geta,eta
  geta = 1.0/(1.0+8.93*eta+2.41*eta^2)^(2.0/3.0)
  ;return,geta
  return,1
end
