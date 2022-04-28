// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./ens_interface.sol";
import "./storage_interface.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract ENSImpl is ENS {

    Storage store;

    constructor(Storage storageAddr) {
        store = storageAddr;
    }

    function setOwner(string calldata name) public override {
        require(store.retrieveEns(name) == address(0), "Name already taken");
        store.storeEns(name, msg.sender);
    }

    function getOwner(string calldata name) public view override returns (address) {
        return store.retrieveEns(name);
    }
}
