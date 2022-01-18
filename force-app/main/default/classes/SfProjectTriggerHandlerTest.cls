@isTest
public with sharing Class SfProjectTriggerHandlerTest {
    @isTest
    static void testProjectInsert(){
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Name__c = 'test project';
        sp.Status__c = 'New';
        insert sp;
        list<salesforce_project__c> spList = new List<salesforce_project__c>();
        spList.add(sp);
        
        test.startTest();
        //test insert ticket method
        SalesforceProjectTriggerHandler.createDefaultSalesforceTicket(spList);
        test.stopTest();
        
        //how to test if a ticket is inserted????
        //we will query soql on which object???
            //soql on sp?
        Salesforce_Ticket__c insertedST = [select id, subject__c from Salesforce_Ticket__c 
                                            where Salesforce_Project__c = :sp.id limit 1];
        system.assert(insertedST != null);
        System.assertEquals('Default ST', insertedST.Subject__c);
        //assert
    }

    @istest
    static void testProjectUpdateStatusCheckError() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Name__c = 'test project';
        sp.Status__c = 'New';
        insert sp;

        //insert salesforce ticket.
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Test ticket.';
        st.Salesforce_Project__c = sp.id;
        insert st;

        //update project status
        Test.startTest();
        try {
            sp.Status__c = 'Completed';
             update sp;
        } catch (Exception ex) {
            system.assert(ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        
        Test.stopTest();

    }

    @istest
    static void testProjectUpdateDescriptionFuture() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Name__c = 'test project';
        sp.Status__c = 'New';
        insert sp;

        //update project status
        Test.startTest();
        SalesforceProjectTriggerHandler.updateProjectDescriptionFuture(new set<id>{sp.id});
        Test.stopTest();

        List<Salesforce_Project__c> spList = [select id, name, description__c from Salesforce_Project__c];
        System.assert(spList != null);
        system.assert(spList.get(0).Description__c.contains('Future'));
    }
}