# L1

exp_n <- function(N0,r,t)
{
  return(N0*exp(r*t))
}


plot(1:100,exp_n(N0=100,r=0.01,t=1:100))

for(i in 2:100)
{
  N[i+1] <- N[i]*exp(r)
}