pragma solidity 0.5.1;

contract Mycontract {
    // // these are the types of values allows in Solidity

    // string public stringValue = "myString";
    // bool public myBool = true;
    // int public myInt = -1;
    // uint public myUint = 1;
    // uint8 public myUint8 = 8;
    // uint256 public myUint256 = 99999;


    /////////////////////////////////////


    // // enum (enumerated list) allows you to keep track of a set list of things in contract

    // enum State { Waiting, Ready, Active } // keeps track of these three states
    // State public state;

    // constructor() public {
    //     state = State.Waiting;
    // }

    // function activate() public {
    //     state = State.Active;
    // }

    // function isActive() public view returns(bool) {
    //     return state == State.Active;
    // }


    /////////////////////////////////////


    // // structs are a way to define your own data structures within Solidity

    // We can do the Person[] as a mapping instead
    // Person[] public people; // creates a public array of Person structs called people

    // Person[] mapping solution
    mapping(uint => Person) public people;
    uint256 public peopleCount = 0;

    // address owner; // required to the compiler knows their is going to be an 'owner' address

    // creates a modifier which can be added to function headers
    // see the addPerson function for example of how to use a modifier
    // modifier onlyOwner() {
    //     require(msg.sender == owner); // require statements must evaluate to true
    //     _;
    // }

    uint256 openingTime = 1610973800;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime); // require statements must evaluate to true
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    // the constructor is only run once when the contract is deployed
    // it sets the owner of the contract to be the person who deployed it
    // constructor() public {
    //     owner = msg.sender;
    // }

    // Only the owner of the contract (the person who deployed it) can use addPerson
    function addPerson( // function name
            string memory _firstName, // function arguement
            string memory _lastName // function arguement
        )
            public // funciton modifier
            onlyWhileOpen // funciton modifier
        {
            // Pushes into the Person[] array *** not going to be used ***
            // Mappings are BETTER
            // people.push(Person(_firstName, _lastName));
            // peopleCount++;

            // add people into the people mapping *** DO IT THIS WAY ***
            // function code that gets executed found on two lines below
            incrementCount();
            people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        }

    function incrementCount() internal {
        peopleCount++;
    }
}
