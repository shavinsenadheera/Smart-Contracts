pragma solidity ^0.4.18;

contract Election
{
    address owner;
    uint totalvotes;
    uint countcandidates = 0;
    struct candidate{string name; uint256 votes;}
    struct voter{bool voted;bool authorized;}
    mapping(address => voter) Voters;
    candidate[] candidates;
    address[5] users = [0xbBEa9A07208A6AD3d44FbB0fb7E71D515aF0e887,0x7dC6186397B7A997187Aa871Ac7b99EB46a44cc8,0x42910673e4F1d6E579bB3F4405399199B37AD686,0x42910673e4F1d6E579bB3F4405399199B37AD686,0x60E117731057a9C02Db1b2dF8cf0ea1e4908D534];
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isowner()
    {
        require(msg.sender==owner);
        _;
    }
    
    function addcandidate(string _name) isowner public
    {
        candidates.push(candidate(_name, 0));
        countcandidates++;
    }
    
    modifier isauthorized()
    {
        for(uint i = 0; i < 5; i++ )
        {
          if(users[i]==msg.sender)
          {
              Voters[msg.sender].authorized=true;
              _;
          }
        }
    }
    
    function vote(uint _index) isauthorized public
    {
        require(!Voters[msg.sender].voted);
        candidates[_index].votes++;
        Voters[msg.sender].voted=true;
        totalvotes++;
    }
    
    function getvotes(uint _index) public view returns(uint256)
    {
        return candidates[_index].votes;
    }
    
    function gettotalcandidates() public view returns(uint)
    {
        return candidates.length;
    }
    
    function getfullvotes() public view returns(uint256)
    {
        return totalvotes;
    }
}