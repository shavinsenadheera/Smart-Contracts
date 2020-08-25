pragma solidity ^0.4.17;

contract Bank
{
    uint count =0;
    address clientaddress;
    mapping(uint => client) newclient;

    struct client
    {
        address caddress;
        uint cid;
        string name;
        uint bal;
        bool confirm;
    }
    
    function createclient(address _caddress ,string memory _name, uint _balance) public
    {
        newclient[count++] = client(_caddress,count+1111, _name, _balance,false);
    }
    
    function getclient(uint _cid) public view returns(address,uint, string memory, uint)
    {
        return (newclient[_cid].caddress,newclient[_cid].cid, newclient[_cid].name, newclient[_cid].bal);
    }
    
    function confirmaccount(uint _cid) public
    {
        require(newclient[_cid].caddress==msg.sender);
        newclient[_cid].confirm = true;
    }
    
    function saveamount(uint _cid, uint _amount) public
    {
        require(newclient[_cid].confirm==true);
        newclient[_cid].bal += _amount;
    }
    
    function withraw(uint _cid, uint _amount) public
    {
        require(newclient[_cid].confirm==true);
        newclient[_cid].bal -= _amount;
    }
}
