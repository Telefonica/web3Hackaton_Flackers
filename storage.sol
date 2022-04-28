// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./storage_interface.sol";
import "hardhat/console.sol";

/**
 * @title Storage
 * @dev Store & retrieve values
 */
contract StorageImpl is Storage {

    address private owner;

    constructor(address ownerAddr) {
        owner = ownerAddr;
    }

    struct StorageType {
        string adminCode;
    }

    mapping (address => StorageType) genericData;
    mapping (string => address) ensData;

    function storeEns(string calldata key, address value) public override {
        ensData[key] = value;
    }

    function retrieveEns(string calldata key) public view override returns (address) {
        return ensData[key];
    }

    function storeAdminCode(address key, string calldata value) public override {
        console.log("OWNER:", owner);
        console.log("SENDER:", msg.sender);
        require(msg.sender == owner, "You are not the owner");
        genericData[key].adminCode = value;
    }

    function retrieveAdminCode() public view override returns (string memory) {
        return genericData[msg.sender].adminCode;
    }
}
