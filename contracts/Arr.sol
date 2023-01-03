// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// array, struct, enum, bytes
contract Arr {
    // Enum
    enum Status { Paid, Delivered, Received }
    
    // переменная currentStatus приняла тип данных Status 
    Status public currentStatus;
    function pay() public {
        currentStatus = Status.Paid;
    }
    function delivered() public {
        currentStatus = Status.Delivered;
    }
    function received() public {
        currentStatus = Status.Received;
    }


    // Array
    uint[10] public items = [1, 2, 3]; // массив содержит только 1 тип данных
    uint[3][2] public arr; // вложенный массив, где [2] - внешний массив, [3] - внутренний массив
    uint[] public dynamic; // массив с динамической длинной
    uint public length;

    function pushArr() public {
        items[0] = 100;
        items[5] = 200;

        // из описания выше, так выглядит внешний и внутренний массив
        arr = [
            [1, 2, 3], 
            [4, 5, 6]
        ]; 

        // push доступен только для динамических массивов
        dynamic.push(10);
        dynamic.push(30);
        length = dynamic.length;
    }
    
    function sampleMemory() public view returns (uint[] memory) {
        // в памяти создаем массив с помощью new и обязательно нужно указывать размер массива (10)
        uint[] memory tempArr = new uint[](10);
        tempArr[0] = 1;
        return tempArr;
    }


    // Byte
    bytes public dynamicVar = unicode"тест"; // динамический массив байтов, для нелатинских символов нужно писать unicode
    bytes32 public myVar = "test"; // это переменная, которая имеет размерность 1 байт или 8 битов. Результат будет выводится как массив байтов
    // 1 --> 32

    function getBytesLength() public view returns(uint) {
        return dynamicVar.length;
    }
    function getByte() public view returns(bytes1) {
        // к массиву байтов можно обращаться по индексу
        return myVar[0];
    }


    // Struct
    // это как интерфейс в ts
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }
    struct Balance {
        uint total;
        mapping(uint => Payment) payments;
    }
    mapping(address => Balance) public balances;
    function pay(string memory message) public payable {
        uint paymentNum = balances[msg.sender].total;
        balances[msg.sender].total += 1;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );
        balances[msg.sender].payments[paymentNum] = newPayment;
    }
    function getPayment(address _address, uint _index) public view returns(Payment memory) {
        return balances[_address].payments[_index];
    }
}