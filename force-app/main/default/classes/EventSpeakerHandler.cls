public with sharing Class EventSpeakerHandler {

    public static void rejectDuplicateBookings (List<Event_Speaker__c> newList) {
        List<Event_Speaker__c> esRecords= [select id, Events__c,Speaker__c from Event_Speaker__c ];
        
        for (Event_Speaker__c each : newList) {
        for (Event_Speaker__c existing : esRecords) {
            
        if(each.Events__c == existing.Events__c && each.Speaker__c == existing.Speaker__c){
            
               each.addError('This speaker has already been selected!!');
        }
        
    }
}
    }
}

