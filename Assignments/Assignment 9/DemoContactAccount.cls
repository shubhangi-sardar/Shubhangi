public class DemoContactAccount {
    public DemoContactAccount(){
        List <Contact> contacts = [Select Name From Contact Where Account.Name = 'Eternus'];
        for(Contact c : contacts){
            System.debug(c);
        }
        Integer countContact = contacts.size();
        Account acc = new Account();
     //   if(acc.Name == 'Eternus')
       //     insert acc.Count__c = countContact;
    }

}