pragma solidity ^0.4.18;

contract election
{
    address owner;
    uint256 totalvotes=0;
    uint256 cid = 11111111;
    Candidate[] candidate;
    mapping(address=>Voter) voter;
    
    struct Candidate
    {
        uint256 id;
        string name;
        uint256 votes; 
    }
    
    struct Voter
    {
        bool voted;
    }
    
    constructor() public
    {
        owner = msg.sender;
    }
    
    modifier isowner
    {
        require(owner==msg.sender, "You are not authorized person to modify this contract!");
        _;
    }
    
    function addnewcandidate(string memory _name) public isowner
    {
        candidate.push(Candidate(cid++, _name, 0));
    }
    
    function voting(uint _cindex) public
    {
        require(!voter[msg.sender].voted, "You are not authorized to vote!");
        candidate[_cindex].votes += 1;
        totalvotes += 1;
        voter[msg.sender].voted = true;
    }
    
    function getcandidatedetails(uint _cindex) public view returns(uint256, string memory, uint256)
    {
        return(candidate[_cindex].id, candidate[_cindex].name, candidate[_cindex].votes);
    }
    
    function getcandidatevotes(uint _cindex) public view returns(uint256)
    {
        return candidate[_cindex].votes;
    }
    
    function getTotalvotes() public view returns(uint256)
    {
        return totalvotes;
    }
}
