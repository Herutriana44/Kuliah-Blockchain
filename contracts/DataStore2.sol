// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DataStore1.sol";

// Contract DataStore2 yang mewarisi DataStore1
contract DataStore2 is DataStore1 {

    // Fungsi untuk membaca data dari contract DataStore1
    function readData() public view returns (uint256) {
        return getData();  // Memanggil fungsi dari DataStore1
    }

    // Override fungsi doSomething
    function doSomething() public override pure returns (string memory) {
        return "Doing something different in DataStore2";
    }
}
