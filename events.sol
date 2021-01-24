pragma solidity ^0.6.0;

contract MyContract {
    
    // solidity events allow you to push data outside of the smart contract to consumers using web frontends or mobile applications
    // events need to be declared at the contract level 
    // events are structured data and you can use all data types in solidity inside events 
    // events cannot be read from the smart contract. Contracts cannot get events that have happened in the past 
    // events are a one way communication channel from the blockchain to the outside world 
    // events cost much less gas compared to contract variables. If you do not need to access data at a later date. Use events. 
    
    event NewTrade ( // when making events it is conventional to use CamelCase
        // the indexed keyword allows users to filter by this event field.  
        // indexing events will make your smart contract more expensive to use. 
        // use up to three indexes max for events. If there are four 'indexes' it will NOT work
        uint indexed date, 
        address indexed from, 
        address indexed to, 
        uint amount
    ); // events need to be terminated with a semi-colon;
    
    // to use an event you need to use the 'emit' keyword inside of a function 
        
        function trade(address to, uint amount) external {
            emit NewTrade(now, msg.sender, to, amount);
        }
}
