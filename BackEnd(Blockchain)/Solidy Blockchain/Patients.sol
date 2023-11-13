// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Patients is Ownable {
    enum Role { None, Doctor, Patient, Nurse }

    mapping(address => Role) private patientRoles;

    modifier onlyPatient() {
        require(patientRoles[msg.sender] == Role.Patient, "Not authorized");
        _;
    }

    function _mintPatient(address to, uint256 tokenId, string memory name, uint256 dateOfBirth) internal onlyOwner {
        _mint(to, tokenId);
        patientRoles[to] = Role.Patient;
    }
}
