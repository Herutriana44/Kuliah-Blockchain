// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
    people.push(People(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// pragma solidity ^0.8;

// contract SimpleStorage {
//     uint256 my_integer = 10;
//     bool my_boolean = true;
//     string my_string = "Hello, World";
//     // address my_address = 0x00000000000000000001;
//     bytes my_bytes = "Hello, World";

//     uint256 favoriteNumber;

//     function store(uint256 _favoriteNumber) public {
//         favoriteNumber = _favoriteNumber;
//     }

//     struct People {
//         uint256 favoriteNumber;
//         string name;
//     }

//     People public person = People({favoriteNumber:7, name:"heru"});

//     People[] public people;

//     function addPerson(uint256 _favoriteNumber, string memory _name) public  {
//         people.push(People(_favoriteNumber, _name));
//     }


// }
