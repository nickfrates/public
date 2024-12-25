import { LightningElement, track } from 'lwc';

export default class Greet extends LightningElement {

    @track userName = '';
    @track greeting = '';

    handleNameChange(event) {
        this.userName = event.target.value;
        console.log('🔵 NAME CHANGE EVENT:', this.userName);  // More visible log
    }
    
    handleClick() {
        console.log('🟢 BUTTON CLICKED!');  // More visible log
        if (this.userName) {
            this.greeting = `Hello, ${this.userName}!`;
            console.log('✅ Greeting set to:', this.greeting);
        } else {
            this.greeting = 'Please enter a name';
            console.log('❌ No name entered');
        }
    }
}