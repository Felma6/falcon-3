public with sharing Class BranchTriggerHandler {

        public static void noDeleteBranchWithStudent(List<Branch__c> brnchOldList ) {
            for(Branch__c b : brnchOldList){
                
               List<Student__C> sList= [select Branch__c from Student__C where Branch__c = : b.id];
            
               if(sList.size()>0){
                  b.addError('Cannot Delete Branch has a student');
               }
            }
         }

}