public with sharing Class CaseHandler {
    
    
            //If a High priority case is created or updated, Validate that the description   field is not null. If it is null then show the error message
            public static void validateDescription(List<Case> caseList, map<id,Case> oldMap,  map<id,Case> newMap) {
                try {
                    for (case eachCase : caseList) {
                        if((eachCase.Priority == 'High' && eachCase.description ==null) ||       (oldMap.get(eachCase.id).Priority != oldMap.get(eachCase.id).Priority &&eachCase.description ==null) ){
            
                            eachCase.addError('Description can not be null!');
                        }
                          
                    }
                }catch (System.NullPointerException e) {
                   
                   System.debug('exception is '+e);
                }
                
                
            }
}