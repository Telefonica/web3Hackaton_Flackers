// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface Storage {
    function storeEns(string calldata key, address value) external;
    function retrieveEns(string calldata key) external view returns (address);
    function storeAdminCode(address key, string calldata value) external;
    function retrieveAdminCode() external view returns (string calldata);
}
