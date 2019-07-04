@isTest
public class Test_Contact {

    @testSetup
    static void makeDate () {
        Account acc_1 = new Account (Name = 'Account 1');
        Account acc_2 = new Account (Name = 'Account 2');
        insert new List<Account> {acc_1, acc_2};
        Contact cont_1 = new Contact (FirstName = 'Rak', LastName = 'Sm', AccountId = acc_1.Id);
        insert cont_1;
    }
    
   @isTest
    static void insertContact () {
        List<Account> accList = [SELECT Id from Account];
        
        List<Contact> contList = new List<Contact> ();
        for (Account acc : accList ){
             contList.add  (new Contact (FirstName = 'Rak', LastName = 'Sm', AccountId = acc.Id));
        }
        Test.startTest();
        insert contList;
        System.assertEquals(2, [SELECT Id,Number_of_Contacts__c  from Account WHERE Name ='Account 1' LIMIT 1].Number_of_Contacts__c );
        Test.stopTest();
    }
    @isTest
    static void updateContact () {
    	Account acc_1 = [SELECT Id, Number_of_Contacts__c from Account where Name = 'Account 1' LIMIT 1];
    	Account acc_2 = [SELECT Id, Number_of_Contacts__c from Account where Name = 'Account 2' LIMIT 1];
        Contact cont = [SELECT Id from Contact WHERE AccountID =: acc_1.Id LIMIT 1];
        cont.AccountId = acc_2.Id;
        update cont;
        System.assertEquals(1, [SELECT Id, Number_of_Contacts__c from Account where Name = 'Account 2' LIMIT 1].Number_of_Contacts__c);
        System.assertEquals(0, [SELECT Id, Number_of_Contacts__c from Account where Id =: acc_1.Id LIMIT 1].Number_of_Contacts__c);
    }
    
    @isTest
    static void deleteUndeleteContact () {
    	Account acc_1 = [SELECT Id, Number_of_Contacts__c from Account where Name = 'Account 1' LIMIT 1];
        Contact cont = [SELECT Id, AccountId from Contact WHERE AccountId =: acc_1.ID LIMIT 1];
        delete cont ;
        System.assertEquals(0, [SELECT Id, Number_of_Contacts__c from Account where Id =: acc_1.Id  LIMIT 1].Number_of_Contacts__c);
        undelete cont;
       	System.assertEquals(1, [SELECT Id, Number_of_Contacts__c from Account where Id =: acc_1.Id  LIMIT 1].Number_of_Contacts__c);
    }
}