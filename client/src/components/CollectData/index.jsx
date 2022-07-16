import { useState } from "react";
import useEth from "../../contexts/EthContext/useEth";
import NoticeNoArtifact from "./NoticeNoArtifact";
import NoticeWrongNetwork from "./NoticeWrongNetwork";
import MainForm from "./Forms";

function Main() {
  const { state } = useEth();
  const [value, setValue] = useState("?");

  const main =
    <>
      <div className="contract-container">
      <MainForm/>  
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
