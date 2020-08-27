pragma solidity ^0.6.0;

contract Bank
{
    uint count =0;
    address clientaddress;
    mapping(uint => client) newclient;
    event deposit();
    struct client
    {
        address payable caddress;
        uint cid;
        string name;
        uint bal;
        bool confirm;
    }
    
    function createclient(address payable _caddress ,string memory _name, uint _balance) public
    {
        newclient[count++] = client(_caddress,count+1111, _name, _balance,false);
    }
    
    function getclient(uint _cid) public view returns(address,uint, string memory, uint, string memory)
    {
        string memory _msg;
        if(newclient[_cid].confirm==false)
        {
             _msg = "Account is not verified!";
        }
        else
        {
            _msg = "Account is verified"; 
        }
        return (newclient[_cid].caddress,newclient[_cid].cid, newclient[_cid].name, newclient[_cid].bal, _msg);
    }
    
    function confirmaccount(uint _cid) public
    {
        require(newclient[_cid].caddress==msg.sender);
        newclient[_cid].confirm = true;
    }
    
    function saveamount(uint _cid, uint _amount) external
    {
        require(newclient[_cid].confirm==true);
        newclient[_cid].bal += _amount;
    }
    
    function withraw(uint _cid, uint _amount) public 
    {
        require(newclient[_cid].confirm==true);
        require(newclient[_cid].caddress==msg.sender);
        newclient[_cid].bal -= _amount;
    }
}
