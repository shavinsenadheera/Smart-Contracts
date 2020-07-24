pragma solidity ^0.4.18;

contract Institute
{
    uint256 id;
    string name;
    
    
    function getInstructor() public view returns(uint, string memory)
    {
        return (id, name);
    }
    
    function addInstructor(uint256 _id, string memory _name) public
    {
        id = _id;
        name = _name;
    }
}
