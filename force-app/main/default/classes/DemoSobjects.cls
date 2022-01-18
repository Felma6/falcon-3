public class DemoSobjects {
    public void demoMethod(){
        Account acc = new Account(Name= 'Test', Phone = '4445556633');
     //acc.Name = 'test' ;
     //acc.Phone = ' 4445556633';
     system.debug('acc=>'+ acc);

        Student__c std = new Student__c();
        std.Course_Fees__c = 10000;
        std.Id = 'Test';
    }
}