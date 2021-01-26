pragma solidity 0.6.0;

contract Parent {
    uint data; 
    
    constructor(uint initialData) public {
        // this constructor gets forwarded an arguement from it's child 
        // contract which sets the value for data 
        data = initialData;
    }
    
    function foo() internal {
        
    }
    
}
