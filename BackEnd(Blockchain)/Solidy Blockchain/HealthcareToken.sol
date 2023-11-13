// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Doctors.sol";
import "./Patients.sol";
import "./Nurses.sol";

contract HealthcareToken is ERC721Enumerable, Ownable, Doctors, Patients, Nurses {
    uint256 private tokenIdCounter = 1;

    mapping(uint256 => string) private editLogs;
    mapping(uint256 => string) private patientFiles;

    constructor() ERC721("HealthcareToken", "HT") {}

    function mintDoctor(address to, string memory name, string memory specialization) external onlyOwner {
        _mintDoctor(to, tokenIdCounter, name, specialization);
        tokenIdCounter++;
    }

    function mintPatient(address to, string memory name, uint256 dateOfBirth) external onlyOwner {
        _mintPatient(to, tokenIdCounter, name, dateOfBirth);
        tokenIdCounter++;
    }

    function mintNurse(address to, string memory name, string memory department) external onlyOwner {
        _mintNurse(to, tokenIdCounter, name, department);
        tokenIdCounter++;
    }

    function addEditLog(uint256 tokenId, string memory log) external onlyDoctorOrNurse(tokenId) {
        editLogs[tokenId] = log;
    }

    function getEditLog(uint256 tokenId) external view onlyDoctorOrNurse(tokenId) returns (string memory) {
        return editLogs[tokenId];
    }

    function addPatientFile(uint256 tokenId, string memory file) external onlyPatientOrOwner(tokenId) {
        patientFiles[tokenId] = file;
    }

    function getPatientFile(uint256 tokenId) external view onlyPatientOrOwner(tokenId) returns (string memory) {
        return patientFiles[tokenId];
    }

    function getRole(address account) external view returns (Role) {
        return _getRole(account);
    }
}
