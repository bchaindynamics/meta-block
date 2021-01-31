pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/GSN/GSNRecipientERC20Fee.sol";
import "@openzeppelin/upgrades/contracts/Initializable.sol";

contract Counter is Initializable, GSNRecipientERC20Fee {
  //it keeps a count to demonstrate stage changes
  uint private count;
  address private _owner;
struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    uint256 public candidatesCount;
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters;

    event votedEvent (
        uint indexed _candidateId
    );
  function initialize(uint num) public initializer {
    
    GSNRecipientERC20Fee.initialize("token","tkn");
    _owner = _msgSender();
    count = num;
    _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
            addCandidate("Candidate 1");
        addCandidate("Candidate 2");

  }

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

 function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(
            _candidateId <= candidatesCount && _candidateId > 0,
            "Invalid candidate"
        );
        require(!voters[msg.sender], "Vote must not have voted before.");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
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
