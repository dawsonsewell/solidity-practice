pragma solidity 0.6.0;

contract Modifiers {
    // modiefiers allow you to run some code before you run a funciton
    
    // 1. modifier syntax
    // 2. passing arguments 
    // 3. chaining modifiers 
    // 4. example for access control
    
    address admin;
    
    // by default modifiers are 'internal'
    // meaning you can only call them from within the smart contract 
    modifier myModifier1(uint a) {
        require(a == 10, 'my error message');
        // code you put here will also be executed 
        _; // this is a place holder that the modifier is attached to 
    }
    
    modifier myModifier2(uint a) {
        require(a == 10, 'my error message');
        _;  
    }
    
    modifier onlyAdmin() {
        require(msg.sender == admin, 'You are not the admin');
        _;
    }
    
    
    function foo(uint a) external myModifier1(a) myModifier2(a) {
        // do some stuff after the code of myModifier is executed 
        // after the first modifier is executed the place holder 
        // '_;' will make the second modifier start execution
        // after both modifiers are executed the code found below is 
        // executed 
        
    }
    
    function withdrawFunds() external onlyAdmin {
        // withdraw funds 
    }
    
}
