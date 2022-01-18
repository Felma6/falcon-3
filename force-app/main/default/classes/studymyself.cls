public with sharing Class studymyself {
    public static void studymyself() {

        /*string batchName = 'Falcons ';
        integer totalcandidates = 40;
        boolean isadminCompleted = true;
        system.debug(' Our Batch Name Is = '+ batchname);
        system.debug(' totatl candidates are --> '+ totalcandidates);
        system.debug('Is admin completed? ' + isadminCompleted);

        string batchDescription =  batchName + 'are the best.';
        system.debug(batchName);
        object obj =  'This is a string';
        system.debug(obj);
        object obj2= 10;
        system.debug(obj2);
        string lowercase = 'FALCONS';
        system.debug(lowercase);
        date newdate = date.newinstance(2214, 5, 6);
        system.debug(newdate);
        date today = date.today();
        system.debug(today);
        time newtime= time.newInstance(5,9,5,5);
        system.debug(newtime);
        datetime dt7= datetime.newinstance(14,5,2);
        system.debug(dt7);
        datetime dt8 = datetime.newinstance(newdate, newtime);
        system.debug(dt8);
        */
        list<integer> listinteger = new list<integer>();
        list<string> liststring = new list<string>();
        list<string> listCandidates = new list<string>();
        listCandidates.add('a');
        listCandidates.add('n');
        listCandidates.add('hy');
        listCandidates.add('klm');
        system.debug(listCandidates);
        listCandidates.equals('kerry');
        system.debug(listCandidates);

        set<integer> setinteger = new set<integer>();
        set<string> setstring = new set<string>();
        
    }
}