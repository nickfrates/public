import { LightningElement, track } from 'lwc';

export default class Greet extends LightningElement {

    @track userName = '';
    @track greeting = '';

    handleNameChange(event){
        this.userName = event.target.value;
        console.log('🔵 NAME CHANGE EVENT:', this.userName);
    }

    handleClick(){
        console.log('🟢 BUTTON CLICKED!');
        if(this.userName){
            this.greeting = `Hello, ${this.userName}!`;
            console.log('✅ Greeting set to:', this.greeting);
        } else {
            this.greeting = 'Please enter a name';
            console.log('❌ No name entered');
        }
    }

}