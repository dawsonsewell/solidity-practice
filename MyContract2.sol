pragma solidity 0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        // buy a token and send ether to the wallet
        balances[tx.origin] ++;
    }
}

// contract MyContract {

//     // address payable wallet;
//     // address public token;

//     // constructor(address payable _wallet, address _token) public {
//     //     wallet = _wallet;
//     //     token = _token;
//     // }

//     // function externalBuyToken() external payable {
//     //     buyToken();
//     // }

//     // function buyToken() public payable {
//     //     ERC20Token(address(token)).mint();
//     //     wallet.transfer(msg.value);

//     // }

// }

contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

    constructor(
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name)
    public  {
        symbol = _symbol;
    }

    function mint() public {
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }

}
