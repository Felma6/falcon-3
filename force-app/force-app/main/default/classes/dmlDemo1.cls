public with sharing Class dmlDemo1 {
  public static void dmlInsertDemo_stndObj() {
      //1. instance
      Account acc = new Account();
​
      //2. set field values
      acc.Name = 'SoftInnovas';
      //3. set any other fields
      acc.AccountNumber = 'FALCNS99';
      acc.Active__c = 'Yes';
​
      //4th and the final step is DML
      insert acc;
  }
​
  public static void dmlInsertDemo_cstmObj() {
      Salesforce_Project__c sp = new Salesforce_Project__c();
      sp.Name__c = 'Teach Apex Programming';
      sp.Status__c = 'New';
​
      //final
      system.debug('BEFORE INSERT sp = ' + sp);
      insert sp;
      system.debug('AFTER INSERT sp = ' + sp);
  }
​
  public static void dmlUpdateDemo1_stndObj() {
      //1. instance
      Account acc = new Account();
​
      //2. set field values
      acc.Name = 'SoftInnovas';
      //3. set any other fields
      acc.AccountNumber = 'FALCNS99';
      acc.Active__c = 'Yes';
      //4th and the final step is DML
      insert acc;
​
      system.debug('after insert acc = ' + acc);
​
      acc.Name = 'Salesforce Inc.';
      acc.AccountNumber = 'sfdc101';
​
      //update DML
      update acc;
  }
​
  public static void dmlUpdateDemo3() {
      //1. soql
      account acc = [select id, name, accountNumber from account 
                      where name='SoftInnovas' limit 1];
      
​
      //2. update fields
      acc.Name = 'SoftInnovas Inc.';
      acc.AccountNumber = 'Falcons 999';
      //acc.active__c = 'No'; //will it work?? NO. bcz not in soql.
​
      //3. DML
      update acc;
      system.debug('after update = ' + acc);
​
  }
​
  public static void dmlUpdateDemo2(){
      //1. return any 1 account using soql
      account acc = [select id, name from account 
                  where name='SoftInnovas Inc.' limit 1];
      
      //alternate query
      account acc1 = [ select id from account where id = '0015j0000085bNRAAY'];
      //2. create contact instance
      contact cnt = new contact();
      cnt.LastName = 'Holy';
​
      //3. set the relationship field
      cnt.accountId = acc.id;
      //4. final step....DML
      insert cnt;
  }
}