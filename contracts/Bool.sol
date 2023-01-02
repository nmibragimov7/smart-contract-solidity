// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Bool {
    bool public myBool = true; // хранится в state блокчейна, по умолчанию false

    // аргумент _input и localBool хранятся во временной памяти
    function myFunc(bool _input) public {
        bool localBool = true;
        
        // логические операции
        // localBool && _input;
        // localBool || _input;
        // localBool == _input;
        // localBool != _input;
        // !localBool;

        if(localBool || _input) {

        } else {

        }
    }
}