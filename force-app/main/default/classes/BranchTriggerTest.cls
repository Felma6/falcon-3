@isTest

public with sharing Class BranchTriggerTest {
  
  @isTest
    public   static void  doNotAllowUserToDeleteBranchwithStudent() {

Branch__c b = new Branch__c(Branch_Name__c='IT');

insert b;
List<Student__c> sList= new List<Student__c>();
Student__c s1 = new Student__c(Student_Name__c='Emir');
Student__c s2 = new Student__c(Student_Name__c='Sumeyye'); 
sList.add(s1);
sList.add(s2);



for (Student__c  each : sList) {

   each.Branch__c=b.id;
    
}
insert sList;

try{
    delete b;
} catch(Exception e){
    System.assert(e.getMessage().contains('Cannot Delete Branch has a student'));

}


    }

}