@RestResource(urlMapping='/CuentaAPI/*')
global with sharing class CuentaRESTService {
    /*
    Servicio REST que expone métodos GET y POST para cuentas.
    */

    // GET /services/apexrest/CuentaAPI/{id}
    @HttpGet
    global static Account obtenerCuenta() {
        RestRequest req = RestContext.request;
        String idCuenta = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        Account cuenta = [SELECT Id, Name, Industry FROM Account WHERE Id = :idCuenta LIMIT 1];
        return cuenta;
    }

    // POST /services/apexrest/CuentaAPI/
    @HttpPost
    global static String crearCuenta(String nombre, String industria) {
        Account cuenta = new Account(Name = nombre, Industry = industria);
        insert cuenta;
        return 'Cuenta creada con Id: ' + cuenta.Id;
    }
}
