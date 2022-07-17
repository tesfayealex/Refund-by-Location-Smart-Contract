// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/utils/Strings.sol";

contract Refund {
    // Model a Candidate

    event CompletedEvent (
        address employeeaddress
    );

    event FailedEvent (
        address employeeaddress
    );

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
        uint starting_time;
        uint duration;
        uint last_checked;
        uint gathered_location_count;
        bool contract_truth;
        uint pay_amount;
        Employee employees;
        Employer employer;
    }
    
    // Store accounts that have voted
    mapping(address => contract_data) public contracts;
    
    uint public Contractcount;

    // Store Candidates
    // Fetch Candidate
    mapping(address => Employee) public employees;
    // Store Candidates Count
    uint public Employeecount;

    mapping(address => Employer) public employers;
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
        employers[user_address] = Employer(Employercount, _name, user_address);
    }
    function addEmployee (string memory _name , address user_address) private {
        Employeecount ++;
        employees[user_address] = Employee(Employeecount, _name, user_address);
    }

    function Create_contract_data( uint[2] memory minimum_points, uint[2] memory maximum_points, uint duration, string memory employee_name , address employee_address, address employer_address) public{
        if (!employees[employee_address].isValue){
        addEmployee(employee_name, employee_address);
         }
        Contractcount++;
        contracts[employee_address] = contract_data(Contractcount, minimum_points[0] , minimum_points[1] ,maximum_points[0] , maximum_points [1], block.timestamp ,duration , 0 , 0 ,employees[employee_address],employers[employer_address]);
    }

    function get_location( uint memory longtiude, uint memory latitude, address employee_address , uint work_id) public{
        contract_data = contracts[work_id];
        found_employee = employees[employee_address];
        found_contract = contracts[employee_address];
        
        if ( found_contract.completed != true){
            duration = (now - found_contract.starting_time) / 60 ;
            if (duration < found_contract.duration){ 
                found_contract.gathered_location_count = found_contract.gathered_location_count + 1;
                if (! (found_contract.minimum_point_long <= longitude && found_contract.maximum_point_long >= longitude && found_contract.minimum_point_lat <= latitude && found_contract.maximum_point_lat >= latitude) ){
                    found_contract.contract_truth = false;
                }
            }else if ( duration >=found_contract.duration){
                minimum_check = found_contract.duration * 3 / 4 ;
                if (found_contract.contract_truth && minimum_check <= found_contract.gathered_location_count){
                    found_contract.completed = true;
                    bool sent = payable(address(this)).send(found_contract.pay_amount);
                    require(sent, "invalid balance");
                    CompletedEvent(employee_address);
                }
                else{
                    found_contract.completed = true;
                    FailedEvent(employee_address);
                }
            }
        }
        // contracts[Contractcount] = contract_data(Contractcount, minimum_points[0] , minimum_points[1] ,maximum_points[0] , maximum_points [1],duration , duration,employees[Employeecount],employers[id]);
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