public class contactController{

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String lastName){

        String searchTerm = ((lastName == null || lastName == '') ? '%' : '%' + lastName + '%');

        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE LastName LIKE :searchTerm];

    }

}