// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract DataStore1
contract DataStore1 {

    // Variabel untuk menyimpan data
    uint256 private data;

    // Fungsi untuk menyimpan data
    function storeData(uint256 _data) public {
        data = _data;
    }

    // Fungsi untuk membaca data secara internal
    function getData() public view returns (uint256) {
        return data;
    }

    // Fungsi doSomething untuk override di contract turunan
    function doSomething() public virtual pure returns (string memory) {
        return "Doing something in DataStore1";
    }
}