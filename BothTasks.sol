// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/* IMPORTANT: kindly read these instruction before using these contracts

1st read pdf attached named:"important"


 contracts i've imported are just Owanable and Counters(for generating auto tokenId of nft): 
contract i've made:
myERC20a: for 1st erc20 token that is Darham
myERC20b for 2nd erc20 token named Riyal
Darham: 1st erc20token
Riyal: 2nd erc20 contract
myERC721:
myNft:

How to use:
Just deploy myNft contract and u'll be able to use all tokens,nfts
after deploying u'll see function with "1" as a last alphabet,, like tranfer1 , these all function are related to Darham
and u'll see function with "2" as a last alphabet,, like tranfer2 , these all function are related to Riyal
and function with nothing in last alphabet like "transfer"are related to nft.

to mint darham we have function mintDarham,isi trah riyal k liye

to transfer to anyone use "transfer1" for darham
or "transfer2" for riyal
or "transfer" for nft

u can call buy ngt by 3 types of functions
mintWithether--> payment will be stored in contract, then could be withdrawed to owner by function "withdraw"
mintWithDarham-->direct sent Darham to owner
mintWithRiyal-->direct sent riyal to owner

the whole program tested &  working fine, if u find any problem, u can contact me on discord. thank u.

plz refer to pdf file , u can see it'sexecution step by step

*/


contract myERC20a {
    mapping(address => uint256) private _balances1;

    mapping(address => mapping(address => uint256)) private _allowances1;

    uint256 private _totalSupply1;

    string private _name1;
    string private _symbol1;
    constructor(string memory name1_, string memory symbol1_) {
        _name1 = name1_;
        _symbol1 = symbol1_;
    }

    function name1() public view  returns (string memory) {
        return _name1;
    }
    function symbol1() public view  returns (string memory) {
        return _symbol1;
    }
    function decimals1() public view  returns (uint8) {
        return 18;
    }
    function totalSupply1() public view  returns (uint256) {
        return _totalSupply1;
    }
     function balanceOf1(address account) public view  returns (uint256) {
        return _balances1[account];
    }
    function transfer1(address to, uint256 amount) public  returns (bool) {
        address owner = msg.sender;
        _transfer1(owner, to, amount);
        return true;
    }
    function allowance1(address owner, address spender) public view  returns (uint256) {
        return _allowances1[owner][spender];
    }
    function approve1(address spender, uint256 amount) public  returns (bool) {
        address owner = msg.sender;
        _approve1(owner, spender, amount);
        return true;
    }
    function _approve1(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances1[owner][spender] = amount;
    }


    function transferFrom1(
        address from,
        address to,
        uint256 amount
    ) public  returns (bool) {
        address spender = msg.sender;
        _spendAllowance1(from, spender, amount);
        _transfer1(from, to, amount);
        return true;
    }
    function _spendAllowance1(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        uint256 currentAllowance = allowance1(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve1(owner, spender, currentAllowance - amount);
            }
        }
    }


    function increaseAllowance1(address spender, uint256 addedValue) public returns (bool) {
        address owner = msg.sender;
        _approve1(owner, spender, allowance1(owner, spender) + addedValue);
        return true;
    }
    function decreaseAllowance1(address spender, uint256 subtractedValue) public returns (bool) {
        address owner = msg.sender;
        uint256 currentAllowance = allowance1(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve1(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }
    function _transfer1(
        address from,
        address to,
        uint256 amount
    ) internal {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");


        uint256 fromBalance = _balances1[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        
        _balances1[from] = fromBalance - amount;
        
        _balances1[to] += amount;


    }
    function _mint1(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");


        _totalSupply1 += amount;
        _balances1[account] += amount;

    }
}

contract myERC20b {
    mapping(address => uint256) private _balances2;

    mapping(address => mapping(address => uint256)) private _allowances2;

    uint256 private _totalSupply2;

    string private _name2;
    string private _symbol2;
    constructor(string memory name2_, string memory symbol2_) {
        _name2 = name2_;
        _symbol2 = symbol2_;
    }

    function name2() public view  returns (string memory) {
        return _name2;
    }
    function symbol2() public view  returns (string memory) {
        return _symbol2;
    }
    function decimals2() public view  returns (uint8) {
        return 18;
    }
    function totalSupply2() public view  returns (uint256) {
        return _totalSupply2;
    }
     function balanceOf2(address account) public view  returns (uint256) {
        return _balances2[account];
    }
    function transfer2(address to, uint256 amount) public  returns (bool) {
        address owner = msg.sender;
        _transfer2(owner, to, amount);
        return true;
    }
    function allowance2(address owner, address spender) public view  returns (uint256) {
        return _allowances2[owner][spender];
    }
    function approve2(address spender, uint256 amount) public  returns (bool) {
        address owner = msg.sender;
        _approve2(owner, spender, amount);
        return true;
    }
    function _approve2(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances2[owner][spender] = amount;
    }


    function transferFrom2(
        address from,
        address to,
        uint256 amount
    ) public  returns (bool) {
        address spender = msg.sender;
        _spendAllowance2(from, spender, amount);
        _transfer2(from, to, amount);
        return true;
    }
    function _spendAllowance2(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        uint256 currentAllowance = allowance2(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve2(owner, spender, currentAllowance - amount);
            }
        }
    }


    function increaseAllowance2(address spender, uint256 addedValue) public returns (bool) {
        address owner = msg.sender;
        _approve2(owner, spender, allowance2(owner, spender) + addedValue);
        return true;
    }
    function decreaseAllowance2(address spender, uint256 subtractedValue) public returns (bool) {
        address owner = msg.sender;
        uint256 currentAllowance = allowance2(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve2(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }
    function _transfer2(
        address from,
        address to,
        uint256 amount
    ) internal {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");


        uint256 fromBalance = _balances2[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        
        _balances2[from] = fromBalance - amount;
        
        _balances2[to] += amount;


    }
    function _mint2(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");


        _totalSupply2 += amount;
        _balances2[account] += amount;

    }
}





contract Darham is myERC20a, Ownable {

    constructor() myERC20a("Darham", "DHM") {
        _mint1(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 , 10000 * 10 ** decimals1());
    }

    function mintDarham(address to, uint256 amount) public onlyOwner {
        _mint1(to, amount);
    }
}






contract Riyal is myERC20b, Ownable {

    constructor() myERC20b("Riyal", "RYL") {

        _mint2(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 , 10000 * 10 ** decimals2());
    }

    function mintRiyal(address to, uint256 amount) public onlyOwner {
        _mint2(to, amount);
    }
}








contract myERC721 {
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _owners;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;


    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    function name() public view returns (string memory) {
        return _name;
    }
    
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal  {
        require(myERC721.ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");
        require(to != address(0), "ERC721: transfer to the zero address");


    

        _balances[from] -= 1;
       _balances[to] += 1;
        _owners[tokenId] = to;

    }


    function _mint(address to, uint256 tokenId) internal  {
        
        require(to != address(0), "ERC721: mint to the zero address");


        _balances[to] += 1;
        _owners[tokenId] = to;

        
    }
    

}





contract MyNFT is myERC721 ,  Darham , Riyal  {

    uint256 price = 0.05 ether;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;


    constructor() myERC721("Zeenah", "ZNH") {}

    function _baseURI() internal pure returns (string memory) {
        return "https://api.mynft.com/tokens/";
    }

    function MintWithEther(address to) public payable  {
        require (msg.value >= price , "Not enough ether sent" );
        address  dev = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        payable(dev).transfer((msg.value) /100);
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();

        _mint(to, tokenId);
    }

    function MintWithDarham(address to) public  {
        _transfer1(msg.sender , owner() , 5 );
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();

        _mint(to, tokenId);
    }


    function MintWithRiyal(address to) public  {
         _transfer2(msg.sender , owner() , 10 );
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();

        _mint(to, tokenId);
    }

    function withdraw() public onlyOwner {
        require(address(this).balance>0, "Balanace is 0");
        payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).transfer(address(this).balance);
    }
    




}