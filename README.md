# Decentralized Procurement Sourcing Automation Networks

A comprehensive blockchain-based procurement system built on Stacks using Clarity smart contracts. This system automates the entire procurement workflow from specialist verification to contract execution.

## Overview

This decentralized procurement platform consists of five interconnected smart contracts that handle different aspects of the procurement process:

1. **Procurement Specialist Verification** - Validates and manages procurement specialists
2. **Supplier Discovery** - Manages supplier registration and discovery
3. **RFP Automation** - Automates request for proposal processes
4. **Bid Evaluation** - Evaluates and scores supplier bids
5. **Contract Negotiation** - Facilitates contract negotiations and execution

## Architecture

### Smart Contracts

#### 1. Procurement Specialist Verification (\`procurement-specialist-verification.clar\`)
- Manages verification requests from procurement specialists
- Validates credentials and assigns certification levels
- Tracks reputation scores and specializations
- Provides read-only functions to check verification status

#### 2. Supplier Discovery (\`supplier-discovery.clar\`)
- Handles supplier registration with company details
- Categorizes suppliers by industry and location
- Manages supplier ratings and active status
- Enables discovery of suppliers by category

#### 3. RFP Automation (\`rfp-automation.clar\`)
- Creates and manages Request for Proposals
- Handles supplier invitations to RFPs
- Manages RFP lifecycle (open, closed, expired)
- Tracks RFP requirements and deadlines

#### 4. Bid Evaluation (\`bid-evaluation.clar\`)
- Processes supplier bid submissions
- Evaluates bids with technical and commercial scores
- Selects winning bids based on evaluation criteria
- Maintains bid history and status tracking

#### 5. Contract Negotiation (\`contract-negotiation.clar\`)
- Creates contracts from winning bids
- Handles contract amendments and negotiations
- Manages digital signatures from both parties
- Tracks contract execution status

## Features

### For Procurement Specialists
- Submit verification requests with credentials
- Create and manage RFPs
- Invite suppliers to participate in RFPs
- Evaluate and score supplier bids
- Negotiate and execute contracts

### For Suppliers
- Register with company information and categories
- Receive invitations to relevant RFPs
- Submit competitive bids with proposals
- Participate in contract negotiations
- Maintain reputation and rating scores

### System Benefits
- **Transparency**: All transactions recorded on blockchain
- **Automation**: Reduced manual processes and paperwork
- **Trust**: Cryptographic verification of all parties
- **Efficiency**: Streamlined procurement workflow
- **Auditability**: Complete transaction history
- **Decentralization**: No single point of failure

## Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity smart contract deployment tools
- Basic understanding of blockchain concepts

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd decentralized-procurement
   \`\`\`

2. Deploy the smart contracts to Stacks testnet:
   \`\`\`bash
# Deploy each contract in order
clarinet deploy --testnet
\`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage Examples

### 1. Specialist Verification
\`\`\`clarity
;; Submit verification request
(contract-call? .procurement-specialist-verification submit-verification-request
"PhD in Supply Chain Management, 10 years experience"
"Technology Procurement")
\`\`\`

### 2. Supplier Registration
\`\`\`clarity
;; Register as a supplier
(contract-call? .supplier-discovery register-supplier
"Tech Solutions Inc"
(list "Software" "Hardware" "Consulting")
"San Francisco, CA"
u3)
\`\`\`

### 3. Create RFP
\`\`\`clarity
;; Create a new RFP
(contract-call? .rfp-automation create-rfp
"Cloud Infrastructure Services"
"Seeking cloud hosting and management services"
"Technology"
u100000
u1000
"Must support 99.9% uptime, 24/7 support required")
\`\`\`

### 4. Submit Bid
\`\`\`clarity
;; Submit a bid for an RFP
(contract-call? .bid-evaluation submit-bid
u1
u85000
u30
"Comprehensive cloud solution with dedicated support team")
\`\`\`

### 5. Execute Contract
\`\`\`clarity
;; Sign contract as buyer or supplier
(contract-call? .contract-negotiation sign-contract u1)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Specialist verification workflow
- Supplier registration and discovery
- RFP creation and management
- Bid submission and evaluation
- Contract negotiation and execution

## Security Considerations

- All functions include proper authorization checks
- Input validation prevents invalid data submission
- Status checks ensure proper workflow progression
- Principal verification ensures only authorized actions
- Error handling provides clear feedback

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue in the GitHub repository.
\`\`\`

Let's create the PR details file:

