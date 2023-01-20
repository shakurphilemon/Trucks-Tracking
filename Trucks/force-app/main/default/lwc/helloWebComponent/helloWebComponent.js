import { LightningElement } from 'lwc';
//This defines the current date and add a getter function to the expression

export default class HelloWebComponent extends LightningElement {
    greeting = 'Welcome to Muencher-Tafel';
    currentDate = new Date().toDateString();
    get capitalizedGreeting() {
        return `Hello ${this.greeting.toLocaleLowerCase()}`;
    }
    handleGreetingChange(event) {
        this.greeting = event.target.value;
        
    }
}