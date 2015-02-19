#include <iostream>
#include <stdio.h>
#include <unistd.h>

int main(){
    puts("Hola! Trataré de adivinar un número.");
    puts("Piensa un número entre 1 y 10");
    sleep(5);
    puts("Multiplícalo por 9");
    sleep(5);
    puts("Si el número tiene 2 dígitos, súmalos entre si; si tu número tiene un solo dígito, súmale 0.");
    sleep(5);
    puts("Al numero resultante súmale 4");
    sleep(10);
puts("Muy bien, el resultado es 13 :)");
    
    return 0;
}
