Trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert,after insert,before update, after update) {
  if(trigger.isUpdate && trigger.isBefore){
      SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New,Trigger.NewMap,Trigger.OldMap);
  }
  
      if(trigger.isInsert && trigger.isAfter){
  
     SalesforceProjectTriggerHandler.updateProjectDescriptionFuture(trigger.newMap.keySet());
          //SalesforceProjetTriggerHandler.createDefaultSalesforceTicket(trigger.new);
  
      }
  
     
  }