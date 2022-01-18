public static list<Account> inactiveAccWithClosedWonOpp(string activeType){

    List<account>listAcc=[select name, Active__c, (select stageName, Amount from
    Opportunities) from Account where Active__c=:activeType];

    list<account> newAcc=new list<account>();

    for (account eachAcc : listAcc) {
        for (Opportunity eachOpp :eachAcc.opportunities ) {
            
            if(eachOpp.stageName=='Closed Won' && eachOpp.Amount>5000 ){
                newAcc.add(eachAcc);
            }
        }
    }

    system.debug(newAcc);

    return newAcc;

}
