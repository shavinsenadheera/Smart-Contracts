pragma solidity ^0.4.18;

contract Institute
{
    uint256 id;
    string name;
    address owner;
    
    event instructor( uint _id, string _name );
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isOwner
    {
        require(owner==msg.sender, "You are not owner..! Do not cheat!");
        _;
    }
    
    function getInstructor() public view returns(uint, string memory)
    {
        return (id, name);
    }
    
    function addInstructor(uint256 _id, string memory _name) public isOwner
    {
        id = _id;
        name = _name;
        emit instructor(id, name);
    }
}
