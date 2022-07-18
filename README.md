# Refund-by-Location-Smart-Contract

This project have been uploaded to Rinkeby Testnet
- Admin app - https://refund-by-location-smart-contract.vercel.app/
- Employee app - https://drive.google.com/file/d/14oo1AmQSNL7VQ_eF5tr1EUUq2z9tUQdX/view?usp=sharing

**Table of content**

 [Refund-by-Location-Smart-Contract](#Refund-by-Location-Smart-Contract)
  - [Introduction](#Introduction)
  - [Included Technologies and tools](#Included-Technologies-and-tools)
  - [Dev setup](#Dev-setup)
  - [Root folder](#Root-folder)
  - [Project Structure](#project-structure)
    - [client](#client)
    - [exercises](#exercises)
    - [mobile_app](#mobile_app)
    - [refund_contract](#refund_contract)
    - [screenshots](#screenshots)

## Introduction

<p>
The refund by location smart contract is aimed to be used when one party, for example an employer, agrees to pay another party, for example an employee, for being present in a certain geographic area for a certain duration. The employee’s phone sends its GPS location to a smart contract at a certain interval. Based on the pre-agreed contract codified in an Ethereum smart contract, a cryptocurrency payment is executed when all the agreed conditions are met.  
</p>



## Included-Technologies-and-tools

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

## Dev-setup

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

## Root-folder:

- `README.md`: Markdown text with a brief explanation of the project and the repository structure.
- `Dockerfile`: build users can create an automated build that executes several command-line instructions in a container.

## Project Structure
The Project uses a truffle unbox structure and follows 

### client 
This folder holds the reactjs frontend (Admin panel) codes
### exercises
This folder holds the exercises before begining the project
### mobile_app 
This folder holds the flutter (employee app) codes
### refund contract
This folder holds truffle smart contract and smart contract test files 
### screenshots
This folder holds screenshots of some of the features of the project
