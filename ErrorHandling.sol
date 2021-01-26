pragma solidity ^0.6.0;

// testing is done using Remix Javascript VM 

contract ErrorHandling {
    // 1. What happens whene there is an error?
    // 2. throw // only used in solidity 0.4 or lower *** do not use ***
    // 3. revert()
    // 4. require()
    // 5. assert()
    // 6. Errors in other contracts
    
    uint a; 
    
    function foo() external {
        a = 10;

        // ERROR happens 
        // execution of rest of function is stopped 
        // and any state change that happened inside of the function 
        // is reverted --> a will revert to previous value i.e not 10 
        // When errors happen you still need to pay the gas associated 
        // with running the function 
        
        if(a == 10) {
            revert('This is an error explanation');
        }
        // the above statement can be done better by using require 
        // require tests for errors that can possibly happen within 
        // a smart contract 
        // require is used more for handling runtime errors
        // of the smart contract 
        require(a != 10, 'error message');
        
        // assert is used for errors which should never be able 
        // to happen within a smart contract 
        assert(1 != 10); // this will throw an error if false
        
    }
    
    function willThrow() external pure {
        //test willThrow function to see error string mesasge 
        // on blockchain
        
        // revert('because reasons');
        
        // Testing require error message 
        
        // require(true == false, 'becuase reasons');
        
        // testing assert error message 
        
        // the assert statement will throw an error message 
        // saying VM error: invalid opcode 
        assert(true == false);
    }
    
    // the function below uses code from another contract 
    // when the error happens it propogates to the calling contract 
    function willThrowInOtherContract() external {
        test tester = new test();
        // tester.bar();
        
        // the code below uses call() 
        // call() is a low-level way of calling smart contracts
        // that is vulnerable to re-entry attacks 
        // using call() should be avoided if possible
        
        address(tester).call(abi.encodePacked("bar()"));
        
        // if you deploy the contract and test this call() functionality
        // you will notice that no error is thrown 
        // the value associated with the call will either be set to 
        // true or false 
        // if the value is false -- then there was an error 
        // you can handle this error however you want to 
    }
    
}

// example contract that will be called from ErrorHandling contract
contract test {
    
    function bar() external pure {
        revert('because other reasons');
    }
     
}
