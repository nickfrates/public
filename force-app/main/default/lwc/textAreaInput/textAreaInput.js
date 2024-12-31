import { LightningElement, api } from 'lwc';

export default class TextAreaInput extends LightningElement {
    @api value;
    @api label = 'Text Area Input';
    @api required = false;
    @api placeholder = '';
    @api maxLength;
    @api rows = 4;

    handleChange(event) {
        this.value = event.target.value;
    }
}