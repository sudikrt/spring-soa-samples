public with sharing class AccountShowCaseCntl {

    @AuraEnabled
    public static List<Account> getMostRecentAccount (Integer numOfAccount) {
        if (numOfAccount == null) {
            numOfAccount = 10;
        }
        return [SELECT Id, Name, Phone, Type, LastModifiedDate FROM Account ORDER BY LastModifiedDate DESC LIMIT : numOfAccount];
    }
}