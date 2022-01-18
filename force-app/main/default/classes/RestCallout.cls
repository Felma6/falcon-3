public inherited sharing Class RestCallout {
    public static void makeGetCallout(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        Http http = new Http();

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            System.debug('Response body: '+response.getBody());
            Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(response.getbody());
        List<object> animals = (list<object>)results.get('animals');
            for(object animal : animals){
                String animalName = (string)animal; 
                System.debug('Animal Name: '+animal);
            }

        }
    }
}