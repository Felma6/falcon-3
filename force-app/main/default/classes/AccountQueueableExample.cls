public Class AccountQueueableExample implements Queueable {
    public list<account> acclist = new list<Account>();
    public AccountQueueableExample(list<account> acclist) {
        This.acclist =  acclist ;

    }
    public void execute ( QueueableContext qc) {
        for(account acc : acclist) {
            acc.name = acc.Name + 'si';
        }
        update acclist;
    }
}