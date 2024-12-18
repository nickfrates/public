import { LightningElement, wire, api } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountOpportunities from '@salesforce/apex/OpportunityController.getAccountOpportunities';

export default class OpportunityViewer extends LightningElement {
    @api recordId;
    draftValues = [];
    opportunities = [];
    wiredOpportunityResult;

    columns = [
        {
            label: 'Name', 
            fieldName: 'nameUrl',
            type: 'url',
            typeAttributes: {
                label: { fieldName: 'Name' },
                target: '_blank'
            }
        },
        {
            label: 'Amount', 
            fieldName: 'Amount', 
            type: 'currency',
            editable: true,
            sortable: true
        },
        {
            label: 'Stage', 
            fieldName: 'StageName', 
            type: 'text',
            editable: true,
            sortable: true
        },
        {
            label: 'Close Date', 
            fieldName: 'CloseDate', 
            type: 'date',
            editable: true,
            sortable: true
        }
    ];

    @wire(getAccountOpportunities, {accountId: '$recordId'})
    wiredOpportunities(result) {
        this.wiredOpportunityResult = result;
        if (result.data) {
            this.opportunities = result.data.map(row => ({
                ...row,
                nameUrl: `/${row.Id}`
            }));
        }
    }

    async handleSave(event) {
        const records = event.detail.draftValues;

        try {
            const recordInputs = records.map(draft => {
                const fields = { Id: draft.Id };
                Object.keys(draft).forEach(key => {
                    if (key !== 'Id' && key !== 'nameUrl') {
                        fields[key] = draft[key];
                    }
                });
                return { fields };
            });

            await Promise.all(recordInputs.map(recordInput => 
                updateRecord(recordInput)
            ));

            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Opportunities updated',
                    variant: 'success'
                })
            );

            this.draftValues = [];
            await refreshApex(this.wiredOpportunityResult);

        } catch(error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating records',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }
}