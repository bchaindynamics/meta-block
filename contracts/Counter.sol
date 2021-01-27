pragma solidity ^0.5.0;
 import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
 import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/GSN/GSNRecipientERC20Fee.sol";
//import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/upgrades/contracts/Initializable.sol";


contract Counter is Initializable, GSNRecipientERC20Fee ,ERC20,ERC20Detailed {
  //it keeps a count to demonstrate stage changesERC20
  uint private count;
  address private _owner;

  function initialize(uint num) public initializer {
    
    GSNRecipientERC20Fee.initialize("token","tkn");
    _owner = _msgSender();
    count = num;
    _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
  }
  // contract Counter is ERC20, ERC20Detailed, GSNRecipient {
  // uint private count;
  // address private _owner;
    
  //   constructor (uint num) public ERC20Detailed("SimpleToken", "SIM", 18) {
  //         _owner = _msgSender();
  //   count = num;
  //       _mint(msg.Sender(), 10000 * (10 ** uint256(decimals())));
  //   }

  // accept all requests
  // function acceptRelayedCall(
  //   address,
  //   address,
  //   bytes calldata,
  //   uint256,
  //   uint256,
  //   uint256,
  //   uint256,
  //   bytes calldata,
  //   uint256
  //   ) external view returns (uint256, bytes memory) {
  //   return _approveRelayedCall();
  // }

  // function _preRelayedCall(bytes memory context) internal returns (bytes32) {
  // }

  // function _postRelayedCall(bytes memory context, bool, uint256 actualCharge, bytes32) internal {
  // }

  function owner() public view returns (address) {
    return _owner;
  }

  // getter
  function getCounter() public view returns (uint) {
    return count;
  }

  //and it can add to a count
  function increaseCounter(uint256 amount) public {
    count = count + amount;
  }

  //We'll upgrade the contract with this function after deploying it
  //Function to decrease the counter
  function decreaseCounter(uint256 amount) public returns (bool) {
    require(count > amount, "Cannot be lower than 0");
    count = count - amount;
    return true;
  }

  function setRelayHubAddress() public {
    if(getHubAddr() == address(0)) {
      _upgradeRelayHub(0xD216153c06E857cD7f72665E0aF1d7D82172F494);
    }
  }

  function getRecipientBalance() public view returns (uint) {
    return IRelayHub(getHubAddr()).balanceOf(address(this));
  }

}
