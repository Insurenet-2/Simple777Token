pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";
import { Ownable } from "openzeppelin-solidity/contracts/access/Ownable.sol";
import { SafeMath } from "openzeppelin-solidity/contracts/math/SafeMath.sol";

interface ERC777Token {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function granularity() external view returns (uint256);

    function defaultOperators() external view returns (address[] memory);
    function isOperatorFor(address operator, address tokenHolder) external view returns (bool);
    function authorizeOperator(address operator) external;
    function revokeOperator(address operator) external;

    function send(address to, uint256 amount, bytes calldata data) external;
    function operatorSend(
        address from,
        address to,
        uint256 amount,
        bytes calldata data,
        bytes calldata operatorData
    ) external;

    function burn(uint256 amount, bytes calldata data) external;
    function operatorBurn(address from, uint256 amount, bytes calldata data, bytes calldata operatorData) external;

    event Sent(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 amount,
        bytes data,
        bytes operatorData
    );
    event Minted(address indexed operator, address indexed to, uint256 amount, bytes data, bytes operatorData);
    event Burned(address indexed operator, address indexed from, uint256 amount, bytes data, bytes operatorData);
    event AuthorizedOperator(address indexed operator, address indexed tokenHolder);
    event RevokedOperator(address indexed operator, address indexed tokenHolder);
}


/**
 * @title Simple777Token
 * @dev Very simple ERC777 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `ERC20` or `ERC777` functions.
 * Based on https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/examples/SimpleToken.sol
 */
contract iNETsToken is ERC777 {

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC777("InsureNET Income Stream Token", "iNETs", new address[](0)) {
        _mint(msg.sender, 10000 * 10 ** 18, "Initial supply Tx");
    }
}