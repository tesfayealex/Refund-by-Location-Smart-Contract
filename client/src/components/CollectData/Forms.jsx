import { useState } from "react";
import useEth from "../../contexts/EthContext/useEth";

function MainForm() {
  const { state: { contract, accounts } } = useEth();
  const [timer, setTimer] = useState("");
  const [lat, setLat] = useState("");
  const [lng, setLng] = useState("");

  const handleTimerChange = e => {
    setTimer(e.target.value)
  };
  const handleLatChange = e => {
    setLat(e.target.value)
  };
  const handleLngChange = e => {
    setLng(e.target.value)
  };



  const write = async e => {
    e.preventDefault();
    const newValue = parseInt(151);
    await contract.methods.write(newValue).send({ from: accounts[0] });
  };

  return (
    <div className="mainform">

        <form>
            <label htmlFor="tim">Timer</label>
            <input id="tim" type="text" placeholder="Timer" value={timer} onChange={handleTimerChange}/>
            
            <label htmlFor="lt">Latitude</label>
            <input id="lt" type="number" step="any" placeholder="Latitude" value={lat} onChange={handleLatChange}/>
            
            <label htmlFor="ln">Longitude</label>
            <input id="ln" type="number" step="any" placeholder="Longitude" value={lng} onChange={handleLngChange}/>

            <input type="submit" value="Submit" onClick={write}/>
        </form>

    </div>
  );
}

export default MainForm;
