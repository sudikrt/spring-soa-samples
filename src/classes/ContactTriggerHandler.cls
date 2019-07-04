public with sharing class  ContactTriggerHandler {
	
    private static ContactTriggerHandler handler;
    
    private ContactTriggerHandler () {
    }
    
    public static ContactTriggerHandler getInstance () {
        if (handler == null) {
            handler = new ContactTriggerHandler ();
        }
        return handler;
    }
    
    public ContactTriggerHandler onAfterInsert (List<SObject> newList, Map<Id, SObject> newMap) {
        ContactTriggerService.getInstance ().calculateRollup ((List<Contact>) newList);
        return handler;
    }

    public ContactTriggerHandler onAfterUpdate (List<SObject> newList, List<SObject> oldList,
            Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {
        List<Contact> newListOfContact = new List<Contact> ();
        newListOfContact.addAll((List<Contact>) newList);
        newListOfContact.addAll((List<Contact>) oldList);
       	ContactTriggerService.getInstance ().calculateRollup (newListOfContact);
        return handler;
    }

    public ContactTriggerHandler onAfterDelete (List<SObject> oldList, Map<Id, SObject> oldMap) {
        ContactTriggerService.getInstance ().calculateRollup ((List<Contact>) oldList);
        return handler;
    }


    public ContactTriggerHandler onAfterUnDelete (List<SObject> newList, Map<Id, SObject> newMap) {
        ContactTriggerService.getInstance ().calculateRollup ((List<Contact>) newList);
        return handler;
    }
    
}