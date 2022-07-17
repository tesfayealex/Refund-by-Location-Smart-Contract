import { useState } from "react";
import useEth from "../../contexts/EthContext/useEth";
import NoticeNoArtifact from "./NoticeNoArtifact";
import NoticeWrongNetwork from "./NoticeWrongNetwork";
import MainForm from "./Forms";
import EmployeeList from "./EmployeeList";

function Main() {
  const { state } = useEth();
  const [value, setValue] = useState("?");
  const [employeesLs, setEmployeesLs] = useState([])

  const main =
    <>
      <div className="contract-container emp-list">
        <div className="">
          <EmployeeList employeesLs={employeesLs}/>
        </div>
        <hr />      
        <MainForm setEmployeesLs={setEmployeesLs}/>  
      </div>
    </>;

  return (
    <div className="demo">
      {
        !state.artifact ? <NoticeNoArtifact /> :
          !state.contract ? <NoticeWrongNetwork /> :
            main
      }
    </div>
  );
}

export default Main;
