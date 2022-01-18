Public With sharing Class CaseHandlerTrigger {
    public static Void CaseValidateDescription(List<Case> caseNewList,map<id, case> newCaseMap,map<id, case> oldCaseMap) {
//If a High priority case is updated or created, Validate that the description field is not null. If it is null then show the error message
        for(case eachCase: caseNewList){
            if(eachCase.Priority =='high' && eachCase.Description ==null){

                eachCase.addError('Description cannot be null');
            }
        }

    }
    //For a High priority case do not allow the user to change the priority to something else. Error should be shown on the field.
    public static Void CaseUpdatePriority(List<Case> caseNewList,map<id, case> newCaseMap,map<id, case> oldCaseMap) {

        for(Case eachcase: caseNewList){
            if(oldCaseMap.get(eachCase.id).Priority == 'high' && eachcase.Priority != oldCaseMap.get(eachCase.id).Priority){
                eachcase.addError('Cannot change \'high \' priority case');
            }

        }

    }
}