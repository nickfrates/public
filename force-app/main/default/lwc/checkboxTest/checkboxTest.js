import { LightningElement, api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getTasks from '@salesforce/apex/TaskStatusController.getTasks';
import updateTaskStatus from '@salesforce/apex/TaskStatusController.updateTaskStatus';

const UI_STATUS_ORDER = ['N', 'IP', 'C'];
const SYSTEM_STATUS_MAP = {
    'N': 'Not Started',
    'IP': 'In Progress',
    'C': 'Completed'
};

export default class checkboxTest extends LightningElement {
    @api recordId;
    tasks = [];
    error;
    wiredTasksResult;
    isLoading = true;

    @wire(getTasks, { accountId: '$recordId' })
    wiredTasks(result) {
        this.wiredTasksResult = result;
        this.isLoading = true;
        const { data, error } = result;

        if (data) {
            this.tasks = data.map(task => this.mapTaskStatus(task));
            this.error = undefined;
            this.isLoading = false;
        } else if (error) {
            this.error = error;
            this.tasks = [];
            this.isLoading = false;
            console.error('Error loading tasks:', JSON.stringify(error));
        }
    }

    mapTaskStatus(task) {
        const statusMap = {
            'Not Started': 0,
            'In Progress': 1,
            'Completed': 2
        };
        const statusIndex = statusMap[task.Status] || 0;
        return {
            ...task,
            isNew: statusIndex >= 0,
            isInProgress: statusIndex >= 1,
            isCompleted: statusIndex >= 2
        };
    }

    get noTasks() {
        return !this.isLoading && (!this.tasks || this.tasks.length === 0);
    }

    get hasError() {
        return !this.isLoading && this.error;
    }

    async handleStatusChange(event) {
        const taskId = event.target.dataset.id;
        const newStatus = event.target.dataset.status;
        const isChecked = event.target.checked;
        
        const task = this.tasks.find(t => t.Id === taskId);
        if (!task) return;

        try {
            // Optimistic update
            this.updateLocalTaskStatus(taskId, newStatus);

            // Call Apex to update the task
            await updateTaskStatus({ 
                taskId: taskId, 
                newStatus: SYSTEM_STATUS_MAP[newStatus] 
            });
            
            // Refresh the task list
            await refreshApex(this.wiredTasksResult);
            
            this.showToast('Success', 'Task status updated', 'success');
        } catch (error) {
            console.error('Error updating task:', JSON.stringify(error));
            this.showToast('Error', 'Failed to update task status', 'error');
            // Rollback optimistic update
            await refreshApex(this.wiredTasksResult);
        }
    }

    updateLocalTaskStatus(taskId, newStatus) {
        const statusMap = {
            'N': 0,
            'IP': 1,
            'C': 2
        };
        const statusIndex = statusMap[newStatus] || 0;

        this.tasks = this.tasks.map(task => {
            if (task.Id === taskId) {
                return {
                    ...task,
                    Status: SYSTEM_STATUS_MAP[newStatus],
                    isNew: statusIndex >= 0,
                    isInProgress: statusIndex >= 1,
                    isCompleted: statusIndex >= 2
                };
            }
            return task;
        });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}