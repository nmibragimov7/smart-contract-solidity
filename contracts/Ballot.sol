// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    uint[] candidates;
    mapping(address => bool) public voters;
    
    function vote(uint candidateIdx) public {
        require(!voters[msg.sender] && candidateIdx < candidates.length);
        voters[msg.sender] = true;
        candidates[candidateIdx]++;
    }

    function winningCandidate() public view returns (uint _winningCandidate) {
        uint count = 0;
        for(uint idx = 0; idx < candidates.length; idx++) {
            if(candidates[idx] > count) {
                count = candidates[idx];
                _winningCandidate = idx;
            }
        }
    }

    function get() public view returns (uint[] memory) {
        return candidates;
    }
}
