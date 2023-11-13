// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Nurses is Ownable {
    enum Role { None, Doctor, Patient, Nurse }

    mapping(address => Role) private nurseRoles;

    modifier onlyNurse() {
        require(nurseRoles[msg.sender] == Role.Nurse, "Not authorized");
        _;
    }

    function _mintNurse(address to, uint256 tokenId, string memory name, string memory department) internal onlyOwner {
        _mint(to, tokenId);
        nurseRoles[to] = Role.Nurse;
    }
}
