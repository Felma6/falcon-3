@isTest

public with sharing Class AccountUpdateBatchTest {
   @isTest
   static Void testBatchClass(){

    list<account> acclist = new list<Account>();

    account acc = new account();
    acc.Name = 'test acc2';
    acclist.add(acc);

    account acc2 = new account();
    acc2.Name = 'test acc2';
    acclist.add(acc2);

    for(integer i = 0; i< 1000; i++){
        account acc3 =  new account();
        acc3.Name = 'test acc v'+ i ;
        acclist.add(acc3);
    }
    insert acclist;

    test.startTest();
    AccountUpdateBatch ab = new AccountUpdateBatch();
    Database.executeBatch(ab,2000);
    test.stopTest();

    list<Account> AccUpdated = [select id, name, site from account];
    system.assert(AccUpdated.size() >0 );
    system.assertEquals('www.softinnovas.com' , AccUpdated[0].site);

   }
}