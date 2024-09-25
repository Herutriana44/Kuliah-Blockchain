// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStore {
    
    struct Person {
        string name;
        string homeAddress;
        string birthDate; 
        string gender;
    }
    
    // Array untuk menyimpan data orang
    Person[] public arrayPerson;
    
    // Fungsi untuk menyimpan data
    function storeData(
        string memory name_, 
        string memory homeAddress_, 
        string memory birthDate_, 
        string memory gender_
    ) public {
        // Langsung push struct Person ke array tanpa perlu variabel sementara
        arrayPerson.push(Person(name_, homeAddress_, birthDate_, gender_));
    }
}
