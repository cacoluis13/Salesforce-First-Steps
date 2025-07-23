public class OperacionesDML {
    /*
    Esta clase enseña las operaciones básicas de base de datos en Apex:
    - Insertar
    - Actualizar
    - Eliminar
    */

    // Insertar una cuenta
    public static void insertarCuenta(String nombre, String industria) {
        Account cuenta = new Account(Name = nombre, Industry = industria);
        insert cuenta;
        System.debug('Cuenta creada con Id: ' + cuenta.Id);
    }

    // Actualizar una cuenta
    public static void actualizarCuenta(Id cuentaId, String nuevoNombre) {
        Account cuenta = [SELECT Id, Name FROM Account WHERE Id = :cuentaId LIMIT 1];
        cuenta.Name = nuevoNombre;
        update cuenta;
        System.debug('Cuenta actualizada: ' + cuenta.Name);
    }

    // Eliminar una cuenta
    public static void eliminarCuenta(Id cuentaId) {
        Account cuenta = [SELECT Id FROM Account WHERE Id = :cuentaId LIMIT 1];
        delete cuenta;
        System.debug('Cuenta eliminada: ' + cuentaId);
    }
}
