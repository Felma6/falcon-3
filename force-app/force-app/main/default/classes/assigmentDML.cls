public static Void oppUpdate(list<opportunity> listOpp){
        // listOpp = [select AccountId, stageName, amount from opportunity];
        // list<opportunity> updateOpp = new list<opportunity>();
        for(opportunity eachOpp : listOpp){
            if(eachOpp.amount <=200){
                eachOpp.stageName = 'Closed Lost';
            }

        }
        update listOpp;
    }
    public static integer deleteAssignment(list<opportunity> listOpp){
        list<opportunity> updateOpp = new list<opportunity>();
       for( opportunity eachOpp : listOpp){
           if(eachOpp.name.contains('To be Deleted')){
            updateOpp.add(eachOpp);
           }
       }
       delete updateOpp;
       return updateOpp.size();
    }
    public static list<opportunity> listOpp1(){
        list<opportunity> oppList = [select stageName, account.active__c, name from opportunity where stageName = 'Closed Won'];
        list<opportunity> updateOpp = new list<opportunity>();
        for(opportunity eachOpp: oppList){
            if(eachOpp.account.active__c != 'Yes'){
                updateOpp.add(eachOpp);
            }
        }
    //    system.debug(updateOpp);
        return updateOpp;
    }
    public static list<account> listAcc(){
      list<account> listAcc = [select active__c, name, (select stageName, amount from opportunities) from account where active__c != 'Yes'];
      list<account> updateAcc = new list<account>();
      for(account eachAcc : listAcc){
          for(opportunity eachOpp : eachAcc.opportunities){
                if(eachOpp.stageName == 'Closed Won' && eachOpp.amount>5000){
                 updateAcc.add(eachAcc);
                }
          }
      }
      return updateAcc;