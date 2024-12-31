import { LightningElement, track } from 'lwc';

export default class Greet extends LightningElement {

    @track userName = '';
    @track greeting = '';

    handleNameChange(event){
        this.userName = event.target.value;
    }

    handleClick(){
        if(this.userName){
            this.greeting = `Hello, ${this.userName}!`;
        } else {
            this.greeting = 'Please enter a name';
        }
    }

}