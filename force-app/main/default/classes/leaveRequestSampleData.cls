public with sharing class leaveRequestSampleData {
    @AuraEnabled(cacheable=true)
    public static List<Leave_Request__c> getMyLeaves(){
        try {
            List<Leave_Request__c> leaveList = new List<Leave_Request__c>();
            leaveList = [Select Id,Name,From_Date__c,To_Date__c,Type__c,Status__c FROM Leave_Request__c WHERE User__c=:Userinfo.getuserId() ORDER BY CreatedDate DESC];
            return leaveList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Leave_Request__c> getLeaveRequests(){
        try {
            List<Leave_Request__c> leaveReqList = new List<Leave_Request__c>();
            leaveReqList = [Select Id,Name,From_Date__c,To_Date__c,Type__c,Status__c FROM Leave_Request__c WHERE User__c=:Userinfo.getuserId() ORDER BY CreatedDate DESC];
            return leaveReqList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()); 
        }
    }

}