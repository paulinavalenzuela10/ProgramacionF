module Constantes
implicit NONE
real, parameter :: degarad=(4.0*atan(1.0))/180
real, parameter :: pi=4.0*atan(1.0)
integer, parameter :: pts= 7000 
real, parameter :: da = 1.29
!Coeficientes de arrastre
real, parameter :: esfera = 0.47 
end module Constantes

subroutine sinfriccion  (x0,y0,v0,grad0,xmax,ymax,tiempo)
use Constantes
implicit none 
integer :: I
real, dimension (1:pts) :: x, y, t
real :: x0, y0, v0, grad0
real :: xmax, ymax, tiempo

grad0=grad0*degarad
xmax = x0+((v0*v0*sin(2*grad0))/(9.8))
ymax = y0+((v0*v0*sin(grad0)*sin(grad0)))/(19.6)
tiempo= (2*v0*sin(grad0))/(9.8)

open (1, file= "sinfriccion.dat")
do I=1, pts, 1
t(I)= float(I)*0.01
x(I)= x0+(v0*cos(grad0)*t(I))
y(I)= y0+(v0*sin(grad0)*t(I))-(4.9*t(I)*(t(I)))

write (1,1001) x(I), y(I)
1001 format (f11.5,f11.5)

if (y(I)<0) exit
end do

close (1)
end subroutine sinfriccion




subroutine friccion (x0,y0,v0,grad0,xmaxt,ymaxt,tiempot)
use Constantes
implicit none
integer :: I
character :: objeto
real, dimension (0:pts) :: a,b,c,vela,velb,la,lb
real :: x0,y0,v0,grad0
real :: xmaxt,ymaxt,tiempot
real :: ad, area, radio, cd, masa
print *, "Ingrese la masa en kg"
read *, masa
print *, "Como el proyectil es una esfera, presione E"
read *, objeto
select case (objeto)
case ("E")
print *, "¿Cual es el radio de la esfera?"
read *, radio
area=pi*radio*radio
cd=esfera

case DEFAULT
print *, "No existe"

end select


a(0) = x0
b(0) = y0
vela(0) = v0*cos(grad0)
velb(0) = v0*sin(grad0)
ad = (0.5*da*area*cd)/masa
la(0) = -ad*vela(0)*vela(0)
lb(0) = 9.8-(ad*velb(0)*velb(0))
c(0) = 0
open (2, file="friccion.dat")
write (2,1001) a(0), b(0)
1001 format (f11.5,f11.5)

do I=0, pts, 1
c(I+1)= c(I)+ 0.01
vela(I+1) = vela(I)+la(I)*c(I+1) 
velb(i+1) = velb(I)+lb(I)*c(I+1)
la(I+1) = -ad*vela(I)*vela(I)
lb(I+1) = -9.8-(ad*vela(I)*vela(I))
a(I+1) = a(I)+vela(I)*c(I+1)+(0.5*la(I)*c(I+1)*c(I+1))
b(I+1) = b(I)+velb(I)*c(I+1)+(0.5*lb(I)*c(I+1)*c(I+1))
write (2,*) a(I+1), b(I+1)
if (b(I)<0) exit
end do
close (2)

xmaxt = a(I)
ymaxt = MAXVAL(b)
tiempot = c(I)*10
end subroutine friccion


program proyectilf
use Constantes
implicit none
real :: x0,y0,v0,grad0
real :: xmax,ymax,tiempo,xmaxt,ymaxt,tiempot
real :: error
print *, "Inserte los valores inciales de x,y,v y grad"
read *, x0,y0,v0,grad0
call sinfriccion (x0,y0,v0,grad0,xmax,ymax,tiempo)
call friccion (x0,y0,v0,grad0,xmaxt,ymaxt,tiempot)
error = ((xmax-xmaxt)/xmaxt * 100)
print *, "Coordenadas en", x0,y0
print *, "Velocidad inicial de", v0,"m/s"
print *, "Angulo de", grad0
print *, "---"
print *, "Sin friccion"
print *, "Tiempo en el aire=", tiempo,"s"
print *, "Altura maxima=", ymax, "m"
print *, "Alcance horizontal=", xmax,"m"
print *, "---"
print *, "Con friccion"
print *, "Tiempo en el aire=", tiempot,"s"
print *, "Altura maxima=", ymaxt,"m"
print *, "Alcance horizontal=", xmaxt,"m"
print *, "Y el error al no considerar ninguna el arrastre  del aire es=", error

end program proyectilf

