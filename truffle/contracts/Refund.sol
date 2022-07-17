// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/utils/Strings.sol";

contract Refund {
    // Model a Candidate
    struct Employee {
        uint id;
        string name;
        address public_address;
    }

    struct Employer {
        uint id;
        string name;
        address public_address;
    }
    struct contract_data{
        uint id;
        uint minimum_point_long;
        uint minimum_point_lat;
        uint maximum_point_long;
        uint maximum_point_lat;
        uint duration;
        uint last_checked;
        Employee employees;
        Employer employer;
    }
    
    // Store accounts that have voted
    mapping(uint => contract_data) public contracts;
    uint public Contractcount;

    // Store Candidates
    // Fetch Candidate
    mapping(uint => Employee) public employees;
    // Store Candidates Count
    uint public Employeecount;

    mapping(uint => Employer) public employers;
    // Store Candidates Count
    uint public Employercount;


    // voted event
    event FoundLocationEvent (
        uint indexed _candidateId
    );

    function  initialize_employers(address[] memory a) public {
        for (uint add=0 ; add < a.length; add++){
            addEmployer(string.concat("Employer " , Strings.toString(add)) , a[add]);
            }
        // addEmployee("Employee 1" , a[1]);
    }
    function  initialize_employees(address[] memory a) public{
        // addEmployer("Employer 1" , a[0]);
         for (uint add=0 ; add < a.length; add++){
            addEmployee(string.concat("Employee " , Strings.toString(add)) , a[add]);
            }
    }

    function addEmployer (string memory _name , address user_address) private {
        Employercount ++;
        employers[Employercount] = Employer(Employercount, _name, user_address);
    }
    function addEmployee (string memory _name , address user_address) private {
        Employeecount ++;
        employees[Employeecount] = Employee(Employeecount, _name, user_address);
    }

    function Create_contract_data( uint[2] memory minimum_points, uint[2] memory maximum_points, uint duration, string memory employee_name , address employee_address, uint id) public{
        addEmployee(employee_name, employee_address);
        Contractcount++;
        contracts[Contractcount] = contract_data(Contractcount, minimum_points[0] , minimum_points[1] ,maximum_points[0] , maximum_points [1],duration , duration,employees[Employeecount],employers[id]);
    }

    // function vote (uint _candidateId) public {
    //     // require that they haven't voted before
    //     require(!voters[msg.sender]);

    //     // require a valid candidate
    //     require(_candidateId > 0 && _candidateId <= candidatesCount);

    //     // record that voter has voted
    //     voters[msg.sender] = true;

    //     // update candidate vote Count
    //     candidates[_candidateId].voteCount ++;

    //     // trigger voted event
    //     votedEvent(_candidateId);
    // }
}