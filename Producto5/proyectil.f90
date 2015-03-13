Program Proyectilfinal
implicit none
real, parameter :: pi = 4.0*atan(1.0)
real :: v, a, t, h, r, a_grados
real, parameter :: g = 9.81
real :: x(2000),y(2000)
integer :: i
write (*,*) 'Enter angle of projectile (Real)'
read *, a_grados
write (*,*) 'Enter velocity of projectile (Real)'
read *, v
a = a_grados*pi/180.0
t = 2*v*sin(a)*(1/g)
h = v*v*sin(a)*sin(a)*(1/(2*g))
r = v*v*sin(2*a)*(1/g)
print * , 'Tiempo total de vuelo=' , t
print * , 'Altura máxima alcanzada=' , h
print * , 'Distancia máxima alcanzada=' , r
open(1, file='proy.dat')
do i=1,2000
t = (float(i)*0.01)
x(i) = v*cos(a)*t
y(i) = v*sin(a)*t - 0.5*g*t*t
write(1,*) x(i), y(i)
if (y(i)<0) exit
end do
close(1)
End Program Proyectilfinal
