public inherited sharing Class YouTubeRestAPI {
    public static void getYoutubeDetails(String recordId, String videoId){
        string apiKey = YouTube_API_Setting__mdt.getInstance('API_Key').Value__c;
        string endpointURL = YouTube_API_Setting__mdt.getInstance('Endpoint').Value__c;
        endpointURL += '?part=statistics';
        endpointURL += '&id='+videoId;
        endpointURL += '&key='+apiKey;

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpointURL);

        Http http = new Http();
        HttpResponse response = http.send(request);

        Map<string, object> responseMap = (Map<string, object>)JSON.deserializeUntyped(response.getBody());
        //kind => value
        //etags => value
        //items => array
        //pageInfo =>
        system.debug('responseMap: '+responseMap);
        List<object> items = (List<object>)responseMap.get('items');
        system.debug('items: '+items);

        Map<string, object> item = (Map<string, object>)JSON.deserializeUntyped(JSON.serialize(items[0]));
        System.debug('item: '+item);

        object statistics = item.get('statistics');
        System.debug('statistics: '+statistics);

        Map<string, object> statisticsMap = (Map<string, object>)JSON.deserializeUntyped(JSON.serialize(statistics));
        System.debug('statisticsMap: '+statisticsMap);

        YouTube_Video_Detail__c ytd = new YouTube_Video_Detail__c();
        ytd.Id = recordId;
        if(statisticsMap.containsKey('likeCount')){
            ytd.Number_of_Likes__c = String.valueOf(statisticsMap.get('likeCount'));
        }
        if(statisticsMap.containsKey('viewCount')){
            ytd.Number_Of__c = String.valueOf(statisticsMap.get('viewCount'));
        }
        update ytd;
    }

    @InvocableMethod
    public static void updateYoutube(List<FlowInputs> flowInputs){
        getYoutubeDetails(flowInputs[0].recordId, flowInputs[0].videoId);
    }

    public class FlowInputs{
        @InvocableVariable public string recordId;
        @InvocableVariable public string videoId;
    }
}