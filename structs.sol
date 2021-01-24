pragma solidity ^0.6.0;

contract MyContract {
    
    // Any time you find yourself using too many variables in your smart contract or repetatively writing certain variables 
    // those variable are likely better of inside of a struct 
    
    struct User {
        // struct attributes 
        address addr; 
        uint score;
        string name;
    }
    
    User[] users;
    mapping(address => User) userList2;
    
    function userName(string calldata _name) external {
        User memory user1 = User(msg.sender, 0, _name); // sets the struct attributes in a specific order. 
        User memory user2 = User(msg.sender, 0, _name);
        User memory user3 = User({name: _name, score:0, addr:msg.sender}); // a more verbose method of creating structs allowing out of order attribute setting 
        
        user3.addr; // this is how you get the value of solidty structs 
        user3.score = 20; // this is how you assign a new value to attributes of solidity structs 
        delete user1; // this is how you delete an instance of a struct 
        
        users.push(user2); // this is how you push a created user into the User[] array 
        userList2[msg.sender] = user2; // creates new User mapping using user2 
    }
    
    function addArrayUser(string calldata _name) external {
        users.push(User(msg.sender, 0, _name)); // defines a new user 
    }
    
    function addMappingUser(string calldata _name) external {
        userList2[msg.sender] = User(msg.sender, 0, _name); // this creates a new User mapping 
    }
}
