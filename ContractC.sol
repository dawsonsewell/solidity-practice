pragma solidity ^0.6.0;

interface InterfaceC {
    function helloAgainWorld() external pure returns(string memory);
}

contract ContractC {
    
    function helloAgainWorld() external pure returns(string memory) {
        return "Hello Again World";
    }
}
