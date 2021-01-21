pragma solidity 0.7.5;

import "./Ownable.sol";

contract Destroyable is Ownable {

    function destroy () public onlyOwner {
        // solution 1 -- directly uses the owners public address
        // not sure why this works for any address responsible for creating the contract
        // even if it is an address other than the one privided within the
        // selfdestruct function call
        // selfdestruct(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        // solution 2 -- gets the address by using the address calling this function
        // which can only be the owner of the smart contract detailed
        // in the Ownable.sol script
        address payable reciever = msg.sender;
        selfdestruct(reciever);
    }

}
