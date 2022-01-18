@isTest
private Class TestEventSpeakerHandler {
       
    @TestSetup 
    private static void  setUpData() {
        
        Event_Organizer__c eo= new Event_Organizer__c(Name=' Best Organization LLC', Email__c='bestorgabizatin@gmail.com',Phone__c='12345566' ); 
        insert eo;
        
        Events__c e = new Events__c(Name__c= 'New Year',Organizer__c= eo.id, Max_Seats__c = 100, Start_Date_Time__c = Datetime.now().addDays(3),Live__c=true );
        insert e;
        Speaker__c s= new Speaker__c(Name='Tony Robbins',Email__c='tonyrobbin@gmail.com',Phone__c='45454344' );
        insert s;
     
        Event_Speaker__c es= new Event_Speaker__c(Events__c= e.id,Speaker__c= s.id);
        insert es;
     
    }
    @isTest
    private static void positiveTest(){
      
        Event_Speaker__c es1 = [Select Events__c,Speaker__c from Event_Speaker__c limit 1];
        Test.startTest();
        Event_Speaker__c es2= new Event_Speaker__c(Events__c=es1.Events__c,Speaker__c=es1.Speaker__c );
        try {
            insert es2;
        } catch (Exception e) {
            
        }
        
        Test.stopTest();
        integer esCount= [select count() from Event_Speaker__c];
        system.assertEquals(1,esCount);
    }
    @isTest
    private static void negativeTest(){
        Event_Speaker__c es = [select id from Event_Speaker__c];
        delete es;
        Events__c e  = [select id from Events__c limit 1];
        Speaker__c s= [select id from Speaker__c limit 1];
        Test.startTest();
        insert new Event_Speaker__c(Events__c=e.id, Speaker__c= s.id);
        Test.stopTest();
        integer esCount= [select count() from Event_Speaker__c];
        system.assertEquals(1,esCount);
    }
}
