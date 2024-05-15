// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.8;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/FactoryERC20.sol";
import "../src/ERC20.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        address gaus = 0xFaBcc4b22fFEa25D01AC23c5d225D7B27CB1B6B8;
        uint privateKey = 0xd68f5d8c457f5675592a7d486aeb7de973a76b12e02430e7dc01956b27af0370;
        uint pvk = 0xfc2f8cc0abd2d9d05229c8942e8a529d1ba9265eb1b4c720c03f7d074615afbb;
        address acc = vm.addr(privateKey);
        console.log("Account", acc);
        vm.startBroadcast(privateKey);
        FactoryERC20 con = new FactoryERC20();
        console.log("contrac is", address(con));
        string memory name = "gaus";
        string memory symbol = "ga";
        uint8 decimals = 18;
        address nToken = con.createToken(name, symbol, decimals, acc);
        console.log("new token is", nToken);
        vm.stopBroadcast();
        vm.startBroadcast(privateKey);
        acc = vm.addr(pvk);
        ERC20(nToken)._mint(acc, 1000e18);
    }
}

//forge script script/ContractDeploy.s.sol:ContractScript --rpc-url https://bsc-testnet.public.blastapi.io --broadcast -vvv --legacy --slow
/* Account 0xFaBcc4b22fFEa25D01AC23c5d225D7B27CB1B6B8
  contrac is 0x99aA71f35d2e8aC762CA748B9D18586c853DbE3F */
