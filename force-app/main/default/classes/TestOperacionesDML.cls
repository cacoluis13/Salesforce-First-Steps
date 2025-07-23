@IsTest
private class TestOperacionesDML {
    @IsTest
    static void testInsertarActualizarEliminar() {
        // Insertar
        Account cuenta = new Account(Name = 'Test Cuenta', Industry = 'Tecnología');
        insert cuenta;

        // Validar insert
        Account cuentaInsertada = [SELECT Id, Name FROM Account WHERE Id = :cuenta.Id];
        System.assertEquals('Test Cuenta', cuentaInsertada.Name);

        // Actualizar
        cuentaInsertada.Name = 'Cuenta Actualizada';
        update cuentaInsertada;

        // Validar update
        Account cuentaActualizada = [SELECT Id, Name FROM Account WHERE Id = :cuenta.Id];
        System.assertEquals('Cuenta Actualizada', cuentaActualizada.Name);

        // Eliminar
        delete cuentaActualizada;

        // Validar eliminación
        Integer countCuentas = [SELECT COUNT() FROM Account WHERE Id = :cuenta.Id];
        System.assertEquals(0, countCuentas);
    }
}
