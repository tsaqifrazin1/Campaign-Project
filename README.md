# Campaign
A decentralized campaign contribution and management system built using Solidity, Web3.js and React. The system allows multiple contributors to contribute to a campaign and allows the campaign manager to create requests for funds and have them approved by the contributors. The system also allows the contributors to withdraw their funds at any given time.

## Flow of the Project

1. **Contract Deployment**: The campaign contract is deployed on the Ethereum blockchain using a deployment script. This contract allows the creation and management of campaign requests.

2. **Contributions**: Users can contribute Ether to a campaign by interacting with the campaign contract. Each contribution is recorded, and the contributor becomes an approver.

3. **Request Creation**: The campaign manager can create spending requests for the contributed funds. Each request includes a description, value, and recipient address.

4. **Approval Process**: Contributors can approve or reject spending requests. A request must receive a majority of approvals from contributors before it can be finalized.

5. **Request Finalization**: Once a request is approved, the manager can finalize it, transferring the specified funds to the recipient.

6. **Withdrawal**: Contributors have the option to withdraw their contributions at any time if they no longer wish to be part of the campaign.

## Technology Used

- **Solidity**: A programming language used for writing smart contracts that run on the Ethereum blockchain.
- **Web3.js**: A JavaScript library that allows interacting with the Ethereum blockchain from a client-side application.
- **React**: A JavaScript library for building user interfaces, used to create the front-end of the application.
- **Mocha**: A JavaScript test framework used for writing and running tests for the smart contracts.
- **Ganache**: A personal Ethereum blockchain used for testing and development.
- **Truffle HDWallet Provider**: A provider used to sign transactions for deploying contracts.