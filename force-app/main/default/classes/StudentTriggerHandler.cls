Public with sharing Class StudentTriggerHandler {
    public static void CreateDefaultSalesforceTicket(list<branch__c> branchlist) {
        List<branch__c> branchwithstudentlist = new List<branch__c>();
        for (branch__c eachBranch : branchlist){
            student__c eachstudent = new Student__c();
            eachstudent.student_name__c = 'fatma';
            eachstudent.branch__c = eachBranch.id;
            branchwithstudentlist.add(eachBranch);
        }
            if(!branchwithstudentlist.isEmpty())
            insert branchwithstudentlist;
    }
}