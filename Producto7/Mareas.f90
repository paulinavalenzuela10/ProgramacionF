program Mareas

implicit none
real, dimension (7674) :: a

integer :: i
real :: mx1, mx2, mx3, mx4, mx5
real :: r1, mxdu1, mxdu2, mxdu3, mxdu4, mxdu5, mxdn1, mxdn2, mxdn3, mxdn4, mxdn5
real :: tiempo1m, tiempo2m, tiempo3m, tiempo4m, tiempo5m
real ::  tiempo1du, tiempo2du, tiempo3du, tiempo4du, tiempo5du, tiempo1dn, tiempo2dn, tiempo3dn, tiempo4dn, tiempo5dn
real :: periodo1m, periodo2m, periodo3m, periodo4m, periodo5m,  periodo1dn, periodo2dn, periodo3dn
real :: periodo1du, periodo2du, periodo3du, periodo4du, periodo5du
real ::  pudx, pndx,  periodomx, r2, periodo4dn, periodo5dn


!abre el archivo y lo lee

open (1, file='Mareas.csv')

do i= 1, 7674
read (1,*) a(i)

end do
close (1)

!Encuentra maximos de cada mes
open (2, file='maximos.csv', status='unknown')
mx1=0
do i=1,1440
r1= mx1-a(i)

if (r1<0) then
mx1 = a(i)

tiempo1m = i*0.5/24

end if
end do

mx2=0
do i= 1441, 2881
r1= mx2-a(i)
if (r1<0) then
mx2= a(i)

tiempo2m = i*0.5/24

end if
end do

mx3=0
do i= 2882, 4322
r1= mx3-a(i)
if (r1<0) then
mx3= a(i)

tiempo3m = i*0.5/24

end if
end do


mx4=0
do i= 4323, 5763
r1= mx4-a(i)
if (r1<0) then
mx4= a(i)

tiempo4m= i*0.5/24

end if
end do

mx5=0
do i= 5764, 7204
r1= mx5-a(i)
if(r1<0) then
mx5= a(i)

tiempo5m= i*0.5/24

end if
end do

!Encuentra maximos diurnos y nocturnos de cada dia

open (3, file='maximosdia.csv', status='unknown')

mxdu1=0
do i= 18, 42
r2= mxdu1-a(i)
if (r2>0) then
mxdu1= a(i)

tiempo1du= i*0.5

end if
end do

!----

mxdn1=0
do i= 43, 67
r2= mxdn1-a(i)
if (r2>0) then
mxdn1= a(i)

tiempo1dn= i*0.5

end if
end do

!-----

mxdu2=0

do i= 68, 92
r2= mxdu2-a(i)
if (r2>0) then
mxdu2= a(i)

tiempo2du= i*0.5

end if
end do

!----

mxdn2=0

do i= 93, 117
r2= mxdn2-a(i)
if (r2>0) then
mxdn2= a(i)

tiempo2dn= i*0.5

end if
end do

!----

mxdu3=0

do i= 118, 142
r2= mxdu3-a(i)
if (r2>0) then
mxdu3= a(i)

tiempo3du=  i*0.5

end if
end do

!-----

mxdn3=0

do i= 143, 167
r2= mxdn3-a(i)
if (r2>0) then
mxdn3= a(i)

tiempo3dn= i*0.5

end if
end do

!----

mxdu4=0
do i= 168, 192
r2= mxdu4-a(i)
if (r2>0) then
mxdu4= a(i)

tiempo4du= i*0.5

end if
end do

!----

mxdn4=0

do i= 193, 217
r2= mxdn4-a(i)
if (r2>0) then
mxdn4= a(i)

tiempo4dn= i*0.5

end if
end do

!---

mxdu5=0
do i= 218, 242
r2= mxdu5-a(i)
if (r2>0) then
mxdu5= a(i)

tiempo5du=  i*0.5

end if 
end do

!--
mxdn5=0

do i= 243, 267
r2= mxdn5-a(i)
if (r2>0) then
mxdn5= a(i)

tiempo5dn= i*0.5

end if
end do

 

!Encuentra periodos mensuales

periodo1m= tiempo1m
periodo2m= tiempo2m-tiempo1m
periodo3m= tiempo3m-tiempo2m
periodo4m= tiempo4m-tiempo3m
periodo5m= tiempo5m-tiempo4m

!Encuentra periodos diarios diurnos

periodo1du= tiempo1du
periodo2du= tiempo2du-tiempo1du
periodo3du= tiempo3du-tiempo2du
periodo4du= tiempo4du-tiempo3du
periodo5du= tiempo5du-tiempo4du

!Encuentra periodos diarios nocturnos

periodo1dn= tiempo1dn
periodo2dn= tiempo2dn-tiempo1dn
periodo3dn= tiempo3dn-tiempo2dn
periodo4dn= tiempo4dn-tiempo3dn
periodo5dn= tiempo5dn-tiempo4dn

!Calcula el promedio de los periodos maximos del mes y del dia

periodomx= (periodo1m+periodo2m+periodo3m+periodo4m+periodo5m)/5.0
pudx= (periodo1du+periodo2du+periodo3du+periodo4du+periodo5du)/5.0
pndx= (periodo1dn+periodo2dn+periodo3dn+periodo4dn+periodo5dn)/5.0


!Imprime los datos


print *, "Maximo del primer mes:", mx1
print *, "Maximo del segundo mes:", mx2
print *, "Maximo del tercer mes:", mx3
print *, "Maximo del cuarto mes:", mx4
print *, "Maximo del quinto mes:", mx5

print *, "Maximo diurno del primer dia:", mxdu1
print *, "Maximo diurno del segundo dia:", mxdu2
print *, "Maximo diurno del tercer dia:", mxdu3
print *, "Maximo diurno del cuarto dia:", mxdu4
print *, "Maximo diurno del quinto dia:", mxdu5

print *, "Maximo nocturno del primer dia:", mxdn1
print *, "Maximo nocturno del segundo dia:", mxdn2
print *, "Maximo nocturno del tercer dia:", mxdn3
print *, "Maximo nocturno del cuarto dia:", mxdn4
print *, "Maximo nocturno del quinto dia:", mxdn5

print *, "Periodo diurno del primer dia", periodo1du
print *, "Periodo diurno del segundo dia", periodo2du
print *, "Periodo diurno del tercer dia", periodo3du
print *, "Periodo diurno del cuarto dia", periodo4du
print *, "Periodo diurno del quinto dia", periodo5du

print *, "Periodo nocturno del primer dia", periodo1dn
print *, "Periodo nocturno del segundo dia", periodo2dn
print *, "Periodo nocturno del tercer dia", periodo3dn
print *, "Periodo nocturno del cuarto dia", periodo4dn
print *, "Periodo nocturno del quinto dia", periodo5dn


print *, "Promedio del periodo maximo mensual:", periodomx
print *, "Promedio del periodo maximo diurno diario:", pudx
print *, "Promedio del periodo maximo nocturno diario:", pndx



end program Mareas

