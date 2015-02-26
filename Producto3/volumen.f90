! Area . f90 : Calculates the area of a circle, sample program
 ! −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
 Program volumendelaesfera! Begin main program
  Implicit None ! Declare all variables
   Real *8 :: radius , height , newradius, volume ! Declare Reals
   Real *8 :: PI = 4.0 * atan(1.0) ! Declare , assign Real
  Integer :: model_n = 1 ! Declare , assign Ints
   print * , 'Enter a Radius:' ! Talk to user
   read * , radius ! Read into radius
   print * , 'Enter a Height:' ! Talk to user
   read * , height ! Take the value of h
  newradius = 3.00 * radius - height 
  volume = 0.333 * PI * height * height * newradius ! Calc Volume
  print * , 'Program number =' , model_n ! Print program number
  print * , 'Radius =' , radius ! Print radius
  print * , 'Height =' , height ! Print height
  print * , 'Volume =' , volume ! Print volume
 End Program volumendelaesfera ! End main program code
