public with sharing Class AccountTriggerHandler {
    public static  void updateAccountDescription(list<account>acclist) {
        system.debug('before trigger on Account Object.');
        system.debug('original trigger.new->'+ acclist);
        for (Account eachacc : acclist){
          if (eachacc.active__c =='yes')
            eachacc.description = 'is active';
          else{
            eachacc.description = '';
           }
        }
    
      system.debug('CHANCED trigger.new -> '+ acclist);
    }
}