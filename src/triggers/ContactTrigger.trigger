trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            ContactTriggerHandler.getInstance().onAfterInsert (Trigger.new, Trigger.newMap);
        }
        if (Trigger.isUpdate) {
            ContactTriggerHandler.getInstance().onAfterUpdate (Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
        }
        if (Trigger.isDelete) {
            ContactTriggerHandler.getInstance().onAfterDelete (Trigger.old, Trigger.oldMap);
        }
        if (Trigger.isUndelete) {
            ContactTriggerHandler.getInstance().onAfterUnDelete (Trigger.new, Trigger.newMap);
        }
    }
}