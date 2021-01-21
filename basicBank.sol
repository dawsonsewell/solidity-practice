pragma solidity 0.7.5;

import "./Ownable.sol";
import "./Destroyable.sol";

interface GovernmentInterface {
    function addTransaction(address _from, address _to, uint _amount) external payable;
}

contract Bank is Ownable, Destroyable {

    GovernmentInterface governmentInstance = GovernmentInterface(0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692);

    mapping(address => uint) balance;

    event depostiDone(uint amount, address indexed depositedTo);


    function depoist() public payable returns (uint)  {
        balance[msg.sender] += msg.value;
        emit depostiDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint amount) public onlyOwner returns (uint) {
        // msg.sender is an address
        require(balance[msg.sender] >= amount,
            "You cannot take out more than you put in");
        msg.sender.transfer(amount);
        balance[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }

    // Do not need to use this code "getOwner()". Can make Ownable.sol into an internal contract if we
    // want to access the only only internally within the contract. Otherwise it is going
    // to be set within the Ownable.sol contract as a public address

    // function getOwner() public view returns (address) {
    //     return owner;
    // }


    function transfer(address recipient, uint amount) public {
        // check balance of msg.sender
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");

        uint previousSenderBalance = balance[msg.sender];

        _transfer(msg.sender, recipient, amount);

        governmentInstance.addTransaction{value: 1 ether}(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount);
        // event logs and further checks
    }


    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}
