! Math . f90 : demo some Fortran math functions
 ! −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
 Program Math! Begin main program

   Complex *8 :: x=- 1.0 , y=2.0, z=0 ! Declare variables x, y, z
  x = sqrt (x)  
  y = asin (y) ! Call the asine function
  z = log (z) ! Call the log function
  print * , x, y, z ! Print x, y, z
 End Program Math ! End main program 
