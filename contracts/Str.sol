// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Str {
    mapping (address => uint) public payments;


    // можно присвоить другой адрес контракту
    address public myAdd = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    function recieveFunds() public payable {
        payments[msg.sender] = msg.value;
    }

    // 1 вариант
    function transferTo1(address payable targetAdd, uint amount) public {
        targetAdd.transfer(amount);
    }
    // 2 вариант
    function transferTo2(address targetAdd, uint amount) public {
        address payable _to = payable(targetAdd);
        _to.transfer(amount);
    }

    function getBalance(address targetAdd) public view returns(uint) {
        return targetAdd.balance;
    }

    string public myStr = "hello"; // storage - сохранение данных требует денег, поэтому большие данные хранят вне, а в блокчейне ссылку на него
    function demo(string memory value) public {
        // memory - указывает на то,что это переменная хранится до тех пор, пока функция выполняется
        // в solidity нельзя:
        // - сравнивать сторки
        // - объединять строки
        // - брать по индексу символ (str[0])

        // для сравнения строк 
        string memory myTemp = "temp";
        myStr = value;
    }
}