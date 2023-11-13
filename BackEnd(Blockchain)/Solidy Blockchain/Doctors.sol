// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Doctors is Ownable {
    enum Role { None, Doctor, Patient, Nurse }

    mapping(address => Role) private doctorRoles;

    modifier onlyDoctor() {
        require(doctorRoles[msg.sender] == Role.Doctor, "Not authorized");
        _;
    }

    function _mintDoctor(address to, uint256 tokenId, string memory name, string memory specialization) internal onlyOwner {
        _mint(to, tokenId);
        doctorRoles[to] = Role.Doctor;
    }
}
