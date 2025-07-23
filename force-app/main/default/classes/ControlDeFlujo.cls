public class ControlDeFlujo {
    /*
    Esta clase enseña a usar estructuras básicas de control en Apex:
    - If / else
    - For loop
    - While loop
    */

    // Método que evalúa si una persona es mayor de edad
    public static void evaluarEdad(Integer edad) {
        if (edad >= 18) {
            System.debug('Eres mayor de edad');
        } else {
            System.debug('Eres menor de edad');
        }
    }

    // Método que imprime números del 1 al 5 usando for
    public static void imprimirConFor() {
        for (Integer i = 1; i <= 5; i++) {
            System.debug('Número con for: ' + i);
        }
    }

    // Método que imprime números del 1 al 5 usando while
    public static void imprimirConWhile() {
        Integer i = 1;
        while (i <= 5) {
            System.debug('Número con while: ' + i);
            i++;
        }
    }
}
