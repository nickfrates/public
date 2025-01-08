import { LightningElement } from 'lwc';

export default class BmiCalculator extends LightningElement {

    cardTitle = 'BMI Calculator';


    changePrivateProperyHandler(){

        this.cardTitle = 'Changed Value';
        console.log('Card Title Value is: ' + this.cardTitle);

    }
}