import { LightningElement, wire } from 'lwc';
import getMyLeaves from '@salesforce/apex/leaveRequestSampleData.getMyLeaves';

const columns = [
    { label: 'Request ID', fieldName: 'name' },
    { label: 'From Date', fieldName: 'fromDate' },
    { label: 'To Date', fieldName: 'toDate' },
    { label: 'Reason', fieldName: 'reason' },
    { label: 'Status', fieldName: 'status' },
    { label: 'Manager Comments', fieldName: 'managerComments'},
];

export default class MyLeaves extends LightningElement {
    myLeaves = [];
    myLeavesResults;

   @wire(getMyLeaves)
   wiredMyLeaves({ error, data }) {
       if (data) {
           this.myLeavesResults = data;
       } else if (error) {
           console.error('Error fetching my leaves:', error);
       }
   }
}