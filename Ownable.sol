pragma solidity 0.7.5;

contract Ownable {

    // -- this code would make the address owner only interally
    // accesable within contracts that inherit the Ownable.sol contract
    // address internal owner;


    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // run the function
    }

    constructor(){
        owner = msg.sender;
    }

}
