// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

contract TokenContract {
    mapping (address => uint256) public bal;
    uint256 public totalSupply;

    constructor() {
        totalSupply = 1000;
        bal[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _amount) public {
        require(bal[msg.sender] >= _amount, "Insufficient balance");
        require(_to != address(0), "Cannot transfer to zero address");

        bal[msg.sender] -= _amount;
        bal[_to] += _amount;
        totalSupply+=_amount;

        assert(bal[msg.sender] + bal[_to] <= totalSupply);
        
        if (bal[msg.sender] < 0) {
            revert("Balance cannot be negative");
        }
    }
}
