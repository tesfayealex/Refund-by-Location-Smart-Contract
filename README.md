# Refund-by-Location-Smart-Contract

## Introduction

<p>
The refund by location smart contract is aimed to be used when one party, for example an employer, agrees to pay another party, for example an employee, for being present in a certain geographic area for a certain duration. The employee’s phone sends its GPS location to a smart contract at a certain interval. Based on the pre-agreed contract codified in an Ethereum smart contract, a cryptocurrency payment is executed when all the agreed conditions are met.  
</p>

## Included Technologies and tools

<p>
Ethereum Blockchain - is the community-run technology powering the cryptocurrency ether (ETH) and thousands of decentralized applications.
</p>
<p>
Truffle - A world class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM), aiming to make life as a developer easier.
</p>

<p>
React - For the front end of the app, we are going to use a well-known javascript framework called React. It has massive support and important addons.
</p>

<p>
Flutter -  is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
</p>

## Dev Setup

    1, setup and install npm environments
        ```bash
            sudo apt install npm nodejs
            npm install -g truffle 
        ```
    2, Install flutter development tools
        ```bash
            Flutter link
        ```
    3, Start truffle server
        ```bash
            truffle --migrate
        ```
    4, start react server
        ```bash
            cd client
            npm install
            npm run
        ```
    5, start flutter app

### root folder:

- `README.md`: Markdown text with a brief explanation of the project and the repository structure.
- `Dockerfile`: build users can create an automated build that executes several command-line instructions in a container.