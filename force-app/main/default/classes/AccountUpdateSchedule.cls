public with sharing Class AccountUpdateSchedule implements Schedulable {
    public void execute(SchedulableContext sc) {
        AccountUpdateBatch accBatch = new AccountUpdateBatch();
        id accBatchID = Database.executeBatch(accBatch, 20);

        system.debug('its midnight');

    }
}