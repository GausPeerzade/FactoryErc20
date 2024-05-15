// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./ERC20.sol";

contract FactoryERC20 {
    event newToken(address token);

    constructor() {}

    function createToken(
        string memory name,
        string memory symbol,
        uint8 decimals,
        address owner
    ) public returns (address) {
        ERC20 token = new ERC20(name, symbol, decimals, owner);

        emit newToken(address(token));
        return address(token);
    }
}
