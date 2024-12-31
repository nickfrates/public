import { LightningElement } from 'lwc';

export default class SomeComponent extends LightningElement {

    resultingProperty = '';

    get myProperty(){
        return "My property value!";
    }

    set myProperty(newValue){
        this.resultingProperty = newValue.toUpperCase();
    }

    updateProperty(event){
        this.myProperty = event.target.value;
    }

}