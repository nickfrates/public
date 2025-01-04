import { LightningElement, track } from 'lwc';

export default class ConditionalRenderingExample extends LightningElement {
    @track displayDiv = false;

    @track cityList = ['Miami', 'NYC', 'Las Vegas'];

    showDivHandler(event){
        this.displayDiv = event.target.checked;
    }
}