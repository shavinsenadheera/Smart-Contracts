pragma solidity ^0.4.17;

contract ToDOList
{
    address owner;
    event tsk(uint, string);
    mapping (uint=>Task) task;
    uint count = 0;

    struct Task
    {
        uint256 id;
        string name;
        bool finish;
    }

    constructor() public
    {
        owner = msg.sender;
    }

    modifier isowner
    {
        require(owner==msg.sender, "You are not the owner");
        _;
    }

    function addtask(string memory _task) public isowner
    {
        task[count] = Task(1111+count, _task, false);
        emit tsk(1111+count, _task);
        count++;
    }

    function gettask(uint _index) public view returns(uint ,string memory, bool)
    {
        return(task[_index].id,task[_index].name, task[_index].finish);
    }

    function finish(uint _index, bool _value) public isowner
    {
        if(_value){
             delete task[_index];
             count--;
        }

    }
}
