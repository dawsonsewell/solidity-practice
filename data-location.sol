pragma solidity 0.5.12;

contract MemoryAndStorage {

    mapping(uint => User) users;

    struct User {
        uint id;
        uint balance;
    }

    function addUser(uint id, uint balance) public {
        users[id] = User(id, balance);
    }


    // solution 1
    // function updateBalance(uint id, uint balance) public {
    //     User storage user = users[id];
    //     user.balance = balance;
    // }


    // solution 2
    function updateBalance(uint id, uint balance) public {
        users[id].balance = balance;
    }


    function getBlalance(uint id) view public returns (uint) {
        return users[id].balance;
    }
}
