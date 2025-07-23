public class ConsultasSOQL {
    /*
    Clase que explica el uso de SOQL para consultar registros de Salesforce.
    SOQL: Salesforce Object Query Language.
    */

    // Consulta básica: obtiene cuentas activas
    public static List<Account> cuentasActivas() {
        List<Account> cuentas = [SELECT Id, Name, Industry FROM Account WHERE IsActive__c = TRUE LIMIT 10];
        return cuentas;
    }

    // Consulta con filtro dinámico y orden
    public static List<Contact> contactosPorCiudad(String ciudad) {
        List<Contact> contactos = [SELECT Id, FirstName, LastName, MailingCity FROM Contact WHERE MailingCity = :ciudad ORDER BY LastName ASC];
        return contactos;
    }

    // Uso de agregaciones (COUNT)
    public static Integer contarOportunidadesGanadas() {
        AggregateResult resultado = [SELECT COUNT(Id) total FROM Opportunity WHERE StageName = 'Closed Won'];
        return (Integer)resultado.get('total');
    }
}
