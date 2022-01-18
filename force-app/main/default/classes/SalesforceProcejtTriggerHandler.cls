public with sharing Class SalesforceProcejtTriggerHandler {

//validate project completion. Allow it only if all tickets are completed
public static void validateProjectCompletion(List<Salesforce_project__c> spTriggerNew,
Map<id, Salesforce_Project__c> spTriggerNewMap, Map<id, Salesforce_Project__c> spTriggerOldMap) {
    //final all project which are completed in this trigger execution
    //so old status is not completed. new status is completed.
    set<id> setCompletedProjectIds = new set<id>();
    //for each loop on trigger.new-> spTriggerNew
    for (salesforce_project__c eachSP : spTriggerNew) {
        //old record
        Salesforce_Project__c oldSP = spTriggerOldMap.get(eachSP.Id);
        //new record
        Salesforce_Project__c newSP = spTriggerNewMap.get(eachSP.Id);
        if (oldSP.status__c != newSp.status__c && newSP.status__c == 'Completed') {
            setCompletedProjectIds.add(eachSP.id);
        }
    }

    //get all the tickets of project which are in setCompletedProjectIds
    //and whose status is not completed.
    List<Salesforce_Ticket__c> stList = [select id, name,Salesforce_Project__c, status__c from Salesforce_Ticket__c
                                        where Salesforce_Project__c in :setCompletedProjectIds
                                        and status__c != 'Completed'];
    //For each loop on list of ticket to give error
    for (Salesforce_Ticket__c eachST : stList) {
        //eachST.Salesforce_Project__c => project id
        Id spid = eachST.Salesforce_Project__c;
        if(setCompletedProjectIds.contains(spid)){
            //get project record to 'AddError'
            Salesforce_Project__c newSP = spTriggerNewMap.get(spid);
            newSP.addError('Cannot complete project because all its ticket are not completed');
        }
    }
}
}