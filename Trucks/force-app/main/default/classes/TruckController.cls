public with sharing class TruckController {
    @AuraEnabled(cacheable=true scope='global')
    public static Truck__c[] getAllTrucks() {
       return [
    SELECT
        Id,
        Name,
        Insurance_Number__c,
        Observations__c,
        Registration_Date__c,
        Location__c,
        Number_Plate__c
    FROM Truck__c
    WITH SECURITY_ENFORCED  
    ORDER BY Name
    LIMIT 50  
       ];

    }

    @AuraEnabled(cacheable=true scope='global')
    public static Truck__c[] searchTrucks(String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getAllTrucks();
        }
        // Prepare query parameters
        searchTerm = '%' + searchTerm + '%';
        // Execute search query
        return [
            SELECT
               Id,
               Name,
               Insurance_Number__c,
               Observations__c,
               Registration_Date__c,
               Location__c,
               Number_Plate__c
           FROM Truck__c
           WITH SECURITY_ENFORCED  
           ORDER BY Name
           LIMIT 50  
              ];
    }
}
