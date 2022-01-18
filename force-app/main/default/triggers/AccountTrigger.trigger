Trigger AccountTrigger on Account (before insert,after insert,before update,after update) {
 
  if(trigger.isBefore){
    
      AccountTriggerHandler.updateAccountDescription(trigger.new);
  }
  
}