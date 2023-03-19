// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20Token {
    function transfer(address _to, uint256 _amount) external;
    function transferFrom(address _from, address _to, uint256 _amount) external;
}

contract AirdropToken {
    //мы должны депонировать монеты в смарт-контракт AirdropToken
    function airdropWithTransfer(
        IERC20Token _token,
        address[] memory _addressArray,
        uint256[] memory _amountArray) public {

        for (uint8 i = 0; i<_addressArray.length; i++)
        {
            _token.transfer(_addressArray[i], _amountArray[i]);
        }

    }

    function airdropWithTransferFrom(
        IERC20Token _token,
        address[] memory _addressArray,
        uint256[] memory _amountArray) public {

        for (uint8 i = 0; i<_addressArray.length; i++)
        {
            _token.transferFrom(msg.sender, _addressArray[i], _amountArray[i]);
        }

    }
}