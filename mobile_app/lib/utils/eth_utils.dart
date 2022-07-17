import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

final ethUtilsProviders = StateNotifierProvider<EthereumUtils, bool>((ref) {
  return EthereumUtils();
});

class EthereumUtils extends StateNotifier<bool> {
  EthereumUtils() : super(true) {
    initialSetup();
  }

  //!Add to the README.md file

  final String _rpcUrl = "http://192.168.0.172:7545";
  final String _wsUrl = "ws://192.168.0.172:7545/";
  final String _privateKey = "";

  // The library web3dart won’t send signed transactions to miners
  // itself. Instead, it relies on an RPC client to do that. For the
  // WebSocket URL just modify the RPC URL.

  // http.Client _httpClient;
  Web3Client? _ethClient; //connects to the ethereum rpc via WebSocket
  bool isLoading = true; //checks the state of the contract

  String? _abi; //used to read the contract abi
  EthereumAddress? _contractAddress; //address of the deployed contract

  EthPrivateKey? _credentials; //credentials of the smart contract deployer

  DeployedContract? _contract; //where contract is declared, for Web3dart
  ContractFunction?
      _userName; // stores the name getter declared in the HelloWorld.sol
  ContractFunction?
      _writeName; // stores the setName function declared in the HelloWorld.sol

  String? deployedName; //will hold the name from the smart contract

  initialSetup() async {
    http.Client _httpClient = http.Client();
    _ethClient = Web3Client(_rpcUrl, _httpClient, socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  readPKey(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) != null
        ? json.decode(prefs.getString(key)!)
        : null;
  }

  Future<void> getAbi() async {
    //Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("assets/contracts_abis/Refund.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abi = jsonEncode(jsonAbi["abi"]);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    String pk = "";
    var val = await readPKey("p_key");
    if (val != null) {
      print("###########ADDED KEY###############");
      print(val);
      _credentials = EthPrivateKey.fromHex(val);
    } else {
      pk = "6c3e36c0fe9fdc3441297a92d0496c686d9d939e5395c525c672a3fe7dd457ea";
      _credentials = EthPrivateKey.fromHex(pk);
    }
  }

  Future<void> getDeployedContract() async {
    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abi!, "SimpleStorage"), _contractAddress!);

    // Extracting the functions, declared in contract.
    _writeName = _contract!.function("getLocation");
    // getValue();
  }

  getValue() async {
    print("##############################");
    print("GETTING VALUE");
    print("##############################");
    // Getting the current name declared in the smart contract.
    var currentName = await _ethClient!
        .call(contract: _contract!, function: _userName!, params: []);
    deployedName = currentName[0].toString();
    isLoading = false;
    state = isLoading;
    // notifyListeners();
  }

  setValue(String valueToSet) async {
    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    state = isLoading;
    // notifyListeners();
    await _ethClient!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _writeName!,
            parameters: [valueToSet]));
    // getValue();
  }

  setValue2(BigInt latitude, BigInt longitude) async {
    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    state = isLoading;
    // notifyListeners();
    await _ethClient!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _writeName!,
            parameters: [latitude, longitude]));
    // getValue();
  }
}
