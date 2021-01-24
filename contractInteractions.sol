pragma solidity ^0.6.0;

import "ContractC.sol";

contract ContractA {
    // 1. call function of other contract 
    // 2. import keyword 
    // 3. contract interface 
    // 4. Note: error propagation -- if their are errors in inherited smart contracts the error will propogate to all smart contracts. 
    
    // 1. call function of other contract 
    
    address addressB;
    
    // 2. import keyword 
    address addressC;
    
    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }
    
    function setAddressC(address _addressC) external {
        addressC = _addressC;
    }
    
    function callHelloWorld() external view returns(string memory) {
        ContractB b = ContractB(addressB); // gain access to contract B by the 'B' keyword and set the variable b to the contract address of B 
        return b.helloWorld();
    }
    
    function helloAgain() external view returns(string memory) {
        // Use the interface created in ContractC.sol
        InterfaceC c = InterfaceC(addressC);
        return c.helloAgainWorld();
    }
    
    
}

contract ContractB {
    function helloWorld() external pure returns(string memory) {
        return "Hello World";
    }
    
}
