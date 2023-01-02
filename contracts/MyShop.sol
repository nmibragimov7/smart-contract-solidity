// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 0xd9145CCE52D386f254917e481eB44e9943F39138
contract MyShop {
    address public owner;
    // mapping - это хранилище (словарь) в виде key: value (address - ключ, uint - значение)
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    // payable - указывает на то, что функция принимает деньги
    function pay() public payable {
        // msg.value создержит в себе сумму транзакции
        payments[msg.sender] = msg.value;
    }

    // списать все деньги владельцу контракта из контракта
    function withdrawAll() public {
        // payable(owner) временно оборачивает переменную owner как payable
        address payable _to = payable(owner);
        // this - это обращение к контексту контракта
        // address(this) вытащит адрес контракта
        address _this = address(this);
        _to.transfer(_this.balance);
    }
}