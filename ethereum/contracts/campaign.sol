// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;

contract CampaignFactory {
    address[] deployedCampaigns;

    function createCampaign(uint256 minimum) public {
        address newCampaign = address(new Campaign(minimum, msg.sender));
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedCampaigns;
    }
}

contract Campaign {
    struct Request {
        string description;
        uint256 value;
        address recipient;
        bool completed;
        uint256 approvalCount;
        mapping(address => bool) approvals;
    }

    Request[] public requests;
    address public manager;
    uint256 public minimunCont;
    mapping(address => bool) public approvers;
    uint256 approversCount;

    constructor(uint256 minimum, address creator) {
        manager = creator;
        minimunCont = minimum;
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function contribute() public payable {
        require(msg.value > minimunCont);

        approvers[msg.sender] = true;
        approversCount++;
    }

    function createRequest(
        string memory description,
        uint256 value,
        address recipient
    ) public restricted {
        Request storage newRequest = requests.push();
        newRequest.description = description;
        newRequest.value = value;
        newRequest.recipient = recipient;
        newRequest.completed = false;
        newRequest.approvalCount = 0;
    }

    function approveRequest(uint256 index) public {
        Request storage request = requests[index];

        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);

        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }

    function finalizeRequest(uint256 index) public restricted {
        Request storage request = requests[index];

        require(!request.completed);
        require(request.approvalCount > (approversCount / 2));

        payable(request.recipient).transfer(request.value);
        request.completed = true;
    }
}
