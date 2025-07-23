public class ConsumoAPIExterna {
    /*
    Ejemplo básico para hacer un POST a un endpoint externo.
    */

    public static void enviarDatosAPI() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');

        // JSON de ejemplo
        String body = '{"title": "foo", "body": "bar", "userId": 1}';
        req.setBody(body);

        try {
            HttpResponse res = http.send(req);
            System.debug('Respuesta: ' + res.getBody());
        } catch (Exception e) {
            System.debug('Error en callout: ' + e.getMessage());
        }
    }
}
