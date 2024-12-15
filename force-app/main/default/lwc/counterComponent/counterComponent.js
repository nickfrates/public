import { LightningElement, api } from 'lwc';

export default class CounterComponent extends LightningElement {
    @api title = 'My Counter';
    count = 0;

    handleIncrement(){
        this.count++;
    }

    handleDecrement(){
        this.count--;
    }

    handleReset(){
        this.count = 0;
    }
}