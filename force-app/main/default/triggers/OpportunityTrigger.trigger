Trigger OpportunityTrigger on Opportunity (before insert,before update) {
  /*if(trigger.isBefore && trigger.isUpdate){
    OpportunityHandler.OpportunityStageUpdateValidation(trigger.new,trigger.oldMap);
  }
  */
  if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
    OpportunityTriggerHandler.OpportunityType(trigger.new, triggerold);
  }
  
  /*if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
    OpportunityHandler.OppDiscountAmountCalculate(trigger.new);
  }
  }

  //2-> Whenever new Opportunity is created with stageName as closed won or closed lost, then set closeDate as  today otherwise set closed date as 15 days from today.
  //3-> When ever the stageName is modified to  closedWon then set the closeDate as  today.
  if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate) ){
     
    OppTriggerHandler.setClosedDate(trigger.new);
     
  }*/
}