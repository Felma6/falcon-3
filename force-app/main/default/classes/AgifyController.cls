public with sharing Class AgifyController {
    public  static void guessAgeForLead(String leadId) {
       try {
           Lead lead = [Select Id,LastName, Age__c FROM lead WHERE Id =: leadId];

           string endpoint = 'https://api.agify.io/?name=' +lead.LastName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        integer statusCode = response.getStatusCode();
        if(statusCode == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<string, object> results = (Map<string, object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            System.debug('results:' + results);

            integer age = (integer) results.get('age');
            lead.Age__c = age;
            update lead;

        }else if(statusCode == 422){
            ErrorLogHelper.createErrorLog('Agify422',response.getBody());

        }
       } catch (Exception exc) {
           system.debug('EXC:' + exc.getMessage());
           ErrorLogHelper.createErrorLog('guessAgeForLead',exc.getMessage());
           
       } 


    }
}

