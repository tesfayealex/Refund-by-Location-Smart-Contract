import { useState, useEffect } from "react";
import useEth from "../../contexts/EthContext/useEth";

function MainForm({setEmployeesLs}) {
  const { state: { contract, accounts } } = useEth();


  useEffect(()=>{
      getEmployees();
  },[])

  async function getEmployees() {

      let count = await contract.methods.Employeecount().call({ from: accounts[0] })
      console.log(count);

      let Employees = []

      for(let i=1;i<=count;i++){
          let employees = await contract.methods.employees(i).call({ from: accounts[0] })
          Employees.push(employees) 
      }

      console.log(Employees)
      setEmployeesLs(Employees)
  }


  const [timer, setTimer] = useState("");
  const [lat, setLat] = useState("");
  const [lng, setLng] = useState("");
  const [lat2, setLat2] = useState("");
  const [lng2, setLng2] = useState("");

  const [employeeName, setEmployeeName] = useState("");
  const [employeeAddress, setEmployeeAddress] = useState("");

  const handleTimerChange = e => {
    setTimer(e.target.value)
  };
  const handleLatChange = e => {
    setLat(e.target.value)
  };
  const handleLngChange = e => {
    setLng(e.target.value)
  };
  const handleLat2Change = e => {
    setLat2(e.target.value)
  };
  const handleLng2Change = e => {
    setLng2(e.target.value)
  };
  const handleENameChange = e => {
    setEmployeeName(e.target.value)
  };
  const handleEAddressChange = e => {
    setEmployeeAddress(e.target.value)
  };


  function setVals(){
    setTimer("")
    setLat("")
    setLng("")
    setLat2("")
    setLng2("")
    setEmployeeName("")
    setEmployeeAddress("")
  }

  const write = async e => {
    e.preventDefault();
    if(timer!=="" && employeeName !== "" && employeeAddress!=="" && lat !== "" && lat2!=="" && lng !== "" && lng2!=="" ){
      let lt1 = lat.split(".").join('')
      let lt2 = lat2.split(".").join('')
      let ln1 = lng.split(".").join('')
      let ln2 = lng2.split(".").join('')
      await contract.methods.Create_contract_data(
        [lt1, lt2],[ln1, ln2], timer, employeeName, employeeAddress, 0
      ).send({ from: accounts[0] });
      getEmployees();
      setVals();
    }
    else{
      alert("All fields are required.")
    }


    // const newValue = parseInt(151);
    // await contract.methods.write(newValue).send({ from: accounts[0] });
  };

  return (
    <div className="mainform">



        <form>

            <label htmlFor="en">Employee Name</label>
            <input id="en" type="text" placeholder="Employee Name" value={employeeName} onChange={handleENameChange}/>
            <label htmlFor="ead">Employee Address</label>
            <input id="ead" type="text" placeholder="Employee Address" value={employeeAddress} onChange={handleEAddressChange}/>

            <label htmlFor="tim">Timer</label>
            <input id="tim" type="number" placeholder="Timer" value={timer} onChange={handleTimerChange}/>
            
            <label htmlFor="lt">Latitude One</label>
            <input id="lt" type="number" step="any" placeholder="Latitude" value={lat} onChange={handleLatChange}/>
            <label htmlFor="lt2">Latitude Two</label>
            <input id="lt2" type="number" step="any" placeholder="Latitude" value={lat2} onChange={handleLat2Change}/>

            
            <label htmlFor="ln">Longitude One</label>
            <input id="ln" type="number" step="any" placeholder="Longitude" value={lng} onChange={handleLngChange}/>
            <label htmlFor="ln2">Longitude Two</label>
            <input id="ln2" type="number" step="any" placeholder="Longitude" value={lng2} onChange={handleLng2Change}/>

            <input type="submit" value="Submit" onClick={write}/>
        </form>

    </div>
  );
}

export default MainForm;
