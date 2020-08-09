pragma solidity ^0.4.17;

contract Transfer
{
    mapping(uint=>List) list;
    event listone(uint, string);
    event trns(uint, address);
    uint256 count =0;
    struct List
    {
        uint id;
        string title;
    }
    
    address owner;
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isowner
    {
        require(owner==msg.sender, "You are not owner!");
        _;
    }
    
    function store(string memory _name) public isowner
    {
        list[count+100] = List(count+1, _name);
        emit listone(count, _name);
        count++;
    }
    
    function returncount() public view returns(uint)
    {
        return count;
    }
    
    function getList(uint _index) public view returns(uint, string memory)
    {
        return (list[_index].id, list[_index].title);
    }
    
    function deleteItem(uint _index) public isowner
    {
        delete list[_index];
    }
    
}
