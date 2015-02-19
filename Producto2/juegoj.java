class juego {
    public static void main(String[] args) {
        System.out.println("Hola! Trataré de adivinar un número");
        System.out.println("Piensa un número enre 1 y 10");

     	try { Thread.sleep(5000); }
	catch (InterruptedException ie){
	System.out.println("Ahora multiplícalo por 9");
	}

	try { Thread.sleep(5000); }
	catch (InterruptedException ie){
 	System.out.println("Si el número tiene 2 dígitos, súmalos 		entre si; Si tu número tiene un solo dígito, súmale 0.");
	}

	try { Thread.sleep(5000); } 
	catch (InterruptedException ie){
 	System.out.println("Al número resultante súmale 4.");
	}

	try { Thread.sleep(5000); } 
	catch (InterruptedException ie){
 	System.out.println("Muy bien. El resultado es 13 :)");
	}
    }
}

