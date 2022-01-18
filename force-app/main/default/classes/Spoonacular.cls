public with sharing Class Spoonacular {
    private static final string url='https://api.spoonacular.com';
    private static final string apikey = 'c67799118aba473d9f2076deaa252648';
    public static void getRandomRecipe() {
        
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(url+'/recipes/random?'+ apikey);
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.

if(response.getStatusCode() == 200) {
   system.debug('response : '+ response.getBody());
}else{
    system.debug('response : '+ response.getStatusCode());
}

    } 
    public static void getRecipeInformation(String recepieId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url+'/recipes/'+recepieId+'/information?apiKey='+apikey);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        
        if(response.getStatusCode() == 200) {
            
            System.debug('response: '+ response.getBody());     
            
        }else{
            System.debug('response: '+ response.getStatusCode());
        }   
        
    }
    public static void searchRecipesbyIngredients(String ingredents) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url+'/recipes/findByIngredients?apiKey='+apikey+'&ingredients='+ingredents);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        
        if(response.getStatusCode() == 200) {
            
            System.debug('response: '+ response.getBody());     
            
        }else{
            System.debug('response: '+ response.getStatusCode());
        }   
        }
}
