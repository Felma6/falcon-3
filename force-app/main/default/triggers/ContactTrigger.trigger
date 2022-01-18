Trigger ContactTrigger on Contact (before insert, before update) {
  if(trigger.isBefore && trigger.isUpdate){
      ContactTriggerHandler.contactUpdateValidation1(Trigger.New);
      ContactTriggerHandler.contactUpdateValidation2(TRIGGER.new, 
                                                      trigger.newMap, 
                                                      trigger.oldMap);
  }
}