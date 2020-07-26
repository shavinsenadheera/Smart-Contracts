pragma solidity ^0.4.18;

contract bank
{
    uint total = 0;
    address owner;
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isOwner
    {
        require(owner==msg.sender);
        _;
    }
    
    function deposite(uint _amount) public
    {
        total += _amount;
    }
    
    function withdraw(uint _amount) public isOwner
    {
        total -= _amount;
    }
    
    function getTotal() public view isOwner returns(uint)
    {
        return total;
    }
}
