// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Integer {
    uint8 public value = 254;
    function increment() public {
        // value = value + 1;
        // value += 1;

        // возрващает к началу диапазона, если превысили верхний лимит
        unchecked {
            value++;
        }
    }

    uint public min;
    uint public max;
    function demo() public {
        min = type(uint8).min;
        max = type(uint8).max;
    }

    // unsigned integer - числа без знака (положительные числа), по умолчанию размерность uint256
    // uint256 - это 2^256 максимальное число
    uint public myUint = 5;
    function myFunc(uint _input) public {
        uint localUint = 42;

        localUint + 1;
        localUint - 1;
        localUint * 2;
        localUint / 2; // при делении отрасывается дробная часть и число округляется
        localUint ** 3; // возведение в степень
        localUint % 3;
        -myInt; // myInt = 5
    }

    // uint8 - это 2^8 = 256 [0, 256 - 1] => [0, 255]
    uint8 myUint8 = 2;
    
    // с шагом +8
    // uint16
    // uint24
    // uint32
    // ...
    // uint256

    // signed integer - числа со знаками (положительные и отрицательные числа)
    int public myInt = -5;

    // размерность в int считается по другому, на знак "-" резервируется 1 бит, то есть будет 2^7 = 128 [-128, 128 -1] => [-128, 127]
    int8 public myInt8 = -1;


}