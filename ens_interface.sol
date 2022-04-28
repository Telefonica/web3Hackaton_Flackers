// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface ENS {
    function setOwner(string calldata name) external;
    function getOwner(string calldata name) external view returns (address);
}
