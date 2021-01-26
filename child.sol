pragma solidity 0.6.0;

// import the contract you want to use by importing the path 
// Note: you can have multiple inheritence --> can inherit/use 
// multiple smart contracts.

// contract Child is Parent1, Parent2, Parent3, Parent4.... 

// all inhertied smart contracts need to be initialized in the 
// constructor function of Child

// constructor() public Parent1 Parent2 Parent3 Parent4...

import "./Parent.sol";

contract Child is Parent {
    
    // need to call the constructor of the Parent contract 
    // to have both constructors run when the contract is deployed 
    // Note: the constructor of Parent will be executed before 
    // the constructor of Child
    constructor(uint initialData) public Parent(initialData) {
        // data is already = 10 
        
    }
    
    function bar() external {
        // we can call function present in the Parent contract 
        foo();
        
        // we can also use/manipulate variables of the Parent contract 
        data++;
    }
    
    
}
