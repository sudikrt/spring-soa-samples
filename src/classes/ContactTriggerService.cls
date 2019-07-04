public with sharing class ContactTriggerService {

    private static ContactTriggerService handler;
    
    private ContactTriggerService () {}
    
    public static ContactTriggerService getInstance () {
        if (handler == null) {
            handler = new ContactTriggerService ();
        }
        return handler;
    }
    public void calculateRollup (List<Contact> contacts) {
        
        Set<Id> accountIdSet = new Set<Id> ();
        for (Contact eachContact : contacts) {
            if (eachContact.AccountId != null) {
                accountIdSet.add (eachContact.AccountId);
            }
        }
        
        if (accountIdSet.size() > 0) {
            List<Account> accToUpdate = new List<Account> ();
            for (Account res : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id in : accountIdSet ]) {
                accToUpdate.add (new Account (
                	Id = res.Id,
                    Number_of_Contacts__c = res.Contacts.size ()
                ));
            }
            /*removed because if there is no contacts found then that account record will not get updated
             * for (AggregateResult res : [SELECT Count(Id) contactCount, 
                                        AccountId
                                        FROM Contact
                                        WHERE AccountId in : accountIdSet GROUP BY AccountId]) {
                                            System.debug('*res : ' + res);
         		accToUpdate.add (new Account (
                	Id = (Id) res.get ('AccountId'),
                    Number_of_Contacts__c = (Integer) res.get ('contactCount')
                ));
        	}*/
			Database.SaveResult [] resList = Database.update(accToUpdate, false); 
            for (Database.SaveResult res : resList) {
                if (!res.isSuccess ()) {
                    System.debug('Update failed :' + res.getId () + ' Errors :' + res.getErrors ());
                }
            }
        }
    }
}