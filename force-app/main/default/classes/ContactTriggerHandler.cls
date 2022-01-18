public with sharing Class ContactTriggerHandler {
    //1. do not allow user to update contact if leadsource is Partner Referral
    public static void contactUpdateValidation1(List<contact> cntTriggerNew) {
        for (contact eachContact : cntTriggerNew) {
            if(eachContact.LeadSource == 'system.label.LeadSourceValidation'){
                eachContact.addError('Cannot update \'Partner Referral\' contact ');
            }
        }
    }
    //2. Do not allow user to update lead source if lead source is not blank 
    //for any contact
    public static void contactUpdateValidation2(List<contact> cntTriggerNew,
    map<id, contact> cntTriggerNewMap,
    map<id, contact> cntTriggerOldmap
    ) {
        map<id, contact> oldMap = cntTriggerOldmap;
        for (contact eachContact : cntTriggerNew) {
            contact oldContactValue = oldMap.get(eachContact.id);
            if(oldContactValue.LeadSource != null 
                && eachContact.LeadSource != oldContactValue.LeadSource)
                eachContact.LeadSource.addError('CANNOT UPDATE LEAD SOURCE! PLEASE USER.');
        }
    }
}