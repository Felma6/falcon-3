Trigger CaseTrigger on Case (before insert, after insert, before update,after update ) {
  
  //1.If a High priority case is created or updated, Validate that the description field is not null. If it is null then show the error message
    if (trigger.isBefore && (trigger.isInsert || trigger.isUpdate) ){
      CaseHandler.validateDescription(trigger.new,trigger.oldMap,trigger.newMap);
            
    }
  }