public with sharing class soqlDemo3 {
  public static void simpleParentTochild() {
      account acc = [select id, name from Account 
          where id = '0015j000003FoJl'];
      system.debug('account id = ' + acc.id);

      List<Contact> listContact = [select firstname, lastname
      from contact where account.id = :acc.Id];

      for (contact eachCnt : listcontact) {
          system.debug(eachCnt);
      }
  }

  public static void simpleParentTochild2() {
      List<account> listAcc = [select id, name from Account limit 10];
      
      list<id> listAccID = new list<id>();
      for (account eachAcc : listAcc) {
          listAccId.add(eachAcc.Id);
      }

      List<Contact> listContact = [select firstname, lastname
      from contact where account.id in :listAccID];

      for (contact eachCnt : listcontact) {
          system.debug(eachCnt);
      }
  }
}

public static Void accountParentToChild3(){

  list<account>Listaccount = [select id, name,phone,(select id ,lastname from Contacts) from Account];
  system.debug(Listaccount);
}
