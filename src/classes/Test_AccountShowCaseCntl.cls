@isTest
public class Test_AccountShowCaseCntl {

    @testSetup
    static void createData () {
        List<Account> accList = new List<Account> ();
        for (Integer index = 0; index < 20; index ++) {
            accList.add(new Account (
            	Name = 'Test + ' + index,
                Phone = '1234567890',
                Type = Math.mod(index, 2) == 0 ?'Customer - Direct': 'Customer - Channel'
            ));
        }
        insert accList;
    }
    
    @isTest
    static void test_getMostRecentRecord_0 () {
        List<Account> accList = AccountShowCaseCntl.getMostRecentAccount(null);
        System.assertEquals(10, accList.size ());
    }
    @isTest
    static void test_getMostRecentRecord_1 () {
        List<Account> accList = AccountShowCaseCntl.getMostRecentAccount(15);
        System.assertEquals(15, accList.size ());
    }
}