// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory
{
    SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public 
    {
        simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    

    function sfsStorage(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public 
    {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfsGetStorage(uint256 _simpleStorageIndex) public view returns(uint256)
    {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}