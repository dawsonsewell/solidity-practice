 pragma solidity ^0.6.0;

contract MyContract {
    
    // declare mappings 
    
    mapping(address => uint) balances;
    
    // the mapping below can be used to allow permissions of certain addresses
    // to spend tokens on behalf of other addresses 
    
    mapping(address => mapping(address => bool)) approved;
    
    function givePermission(address spender) external { 
        // the address msg.sender can be set to have permission to spend tokens 
        // on the behalf of another address through the following code found below
        
        
        approved[msg.sender][spender] = true; 
        
    }
        
    // you can delete the permision using the code below 
    // Note: when the mapping is deleted its value in the mapping technically 
    // still exists. It reverts to its default value, which for booleans is 'false'    
        
    function removePermission(address deleter) external {
        delete approved[msg.sender][deleter];
    }
        
    // You can also make nested mappings using arrays 
    // Note: everything within a solidity mapping is already initiated so 
    // we do not need to initialize mapping values. They are already set to a 
    // default value 
    
    mapping(address => uint[]) scores;
    
    // you can set the mapping for scores using the following function as the sender
    function setArrayMapping(uint arrayLocation, uint _arrayValue) external {
        scores[msg.sender][arrayLocation] = _arrayValue;
    }
    
    function deleteArrayMapping(uint arrayLocation) external {
        // Note: after this runs the arrayLocation is reset to its default value 
        // the default value is 0 for type uint 
        delete scores[msg.sender][arrayLocation];

    }
    
    
}
    
