public with sharing class TaskStatusController {
    @AuraEnabled(cacheable=true)
    public static List<Task> getTasks(Id accountId) {
        System.debug('Received accountId: ' + accountId);
        
        List<Task> tasks = [
            SELECT Id, Subject, Status, WhatId, CreatedDate
            FROM Task 
            WHERE WhatId = :accountId 
              AND Status != null
            ORDER BY CreatedDate DESC
        ];
        
        System.debug('Found tasks: ' + tasks);
        return tasks;
    }

    @AuraEnabled
    public static void updateTaskStatus(Id taskId, String newStatus) {
        try {
            Task taskToUpdate = new Task(
                Id = taskId,
                Status = newStatus
            );
            update taskToUpdate;
        } catch (Exception e) {
            throw new AuraHandledException('Failed to update task: ' + e.getMessage());
        }
    }
}