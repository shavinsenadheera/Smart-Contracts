pragma solidity ^0.4.18;

contract Institute
{
    uint256 id;
    string name;
    address owner;
    uint count = 123456;
    uint256 noof = 0;
    mapping(uint=>instruct) insdetails;
    event instructor( uint _count, uint _id, string _name );
    
    struct instruct
    {
        uint id;
        string name;

    }
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isOwner
    {
        require(owner==msg.sender, "You are not owner..! Do not cheat!");
        _;
    }
    
    function addInstructor(uint256 _id, string memory _name) public isOwner
    {
        noof++;
        insdetails[count] = instruct(_id, _name);
        emit instructor(count ,_id, _name);
        count++;
    }
    
    function getnoof() public view returns(uint)
    {
        return noof;
    }
}
