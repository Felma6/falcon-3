Trigger BranchTrigger on Branch__c (before insert, after insert, before update, after update, before delete) {
if(trigger.isBefore && trigger.isDelete){
    BranchTriggerHandler.noDeleteBranchWithStudent(trigger.old);
   } 
}