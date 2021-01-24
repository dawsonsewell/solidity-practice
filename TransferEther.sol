pragma solidity ^0.6.0; 

contract MyContract {
    
    function foo(address payable to, uint amount) external {
        // by using address payable you gain access to the .transfer method for transfering ether from msg.sender to another address
        to.transfer(amount); // this is automatically denominated in wei as default 
        // 1 wei = 10 ^ -18 ether = 0.0000 .... 1
    }
    
    function bar() external payable {
        msg.value; // checks the value of the ether being sent 
        address(this).balance; // checks the amount of ether held in this smart contract 
        
    }
    
    // A fallbaack function is a function where you do not define the functions name. 
    // The function below is a fallback function. 
    // the fallback function will be executed if a function is called within the smart contract that does not exist. 
    
    fallback() external {
        //
    }
    
    // there is a function for recieving ether directly called the receive function 
    
    receive() external payable {
        //
    }
    
}
