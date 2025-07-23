public class ColeccionesApex {
    /*
    Esta clase enseña a usar colecciones fundamentales:
    - Listas: colecciones ordenadas, permiten duplicados.
    - Sets: colecciones sin duplicados, no ordenadas.
    - Maps: colecciones clave-valor.
    */

    // Método que crea una lista y la recorre
    public static void usarLista() {
        List<String> frutas = new List<String>{'Manzana', 'Banana', 'Mango', 'Manzana'};
        System.debug('Lista de frutas (con duplicados): ' + frutas);

        // Recorremos la lista con for-each
        for (String fruta : frutas) {
            System.debug('Fruta: ' + fruta);
        }
    }

    // Método que crea un set y lo recorre
    public static void usarSet() {
        Set<String> frutasUnicas = new Set<String>{'Manzana', 'Banana', 'Mango', 'Manzana'};
        System.debug('Set de frutas (sin duplicados): ' + frutasUnicas);

        // Recorremos el set
        for (String fruta : frutasUnicas) {
            System.debug('Fruta única: ' + fruta);
        }
    }

    // Método que crea un mapa y lo recorre
    public static void usarMap() {
        Map<String, Decimal> precios = new Map<String, Decimal>{
            'Manzana' => 1.5,
            'Banana' => 0.5,
            'Mango' => 2.0
        };

        // Recorremos las claves y obtenemos valores
        for (String fruta : precios.keySet()) {
            Decimal precio = precios.get(fruta);
            System.debug('El precio de ' + fruta + ' es $' + precio);
        }
    }
}
