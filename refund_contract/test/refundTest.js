var Refund = artifacts.require("Refund.sol");

contract("Refund", function(accounts) {
  var refundInstance;

  it("initializes with two people", function() {
    return Refund.deployed().then(function(instance) {
      refundInstance = instance;
      return refundInstance.initialize_employers([accounts[4],accounts[5],accounts[6]])
    }).then(function(initialized, count) {
        console.log("IIIIIIIOOOOOOOOOOOO")
        // console.log(refundInstance.employers(1))
      return refundInstance.employers(accounts[4]);
   }).then(function(employers) {
      console.log("serdfcgvhbjncgvbncgvbngvhb")
      console.log(employers)
      console.log(accounts[4])
      // assert.equal(employers[1], 'Employee 1');
      return refundInstance.Create_contract_data([878474,3067564],[4882834,325644664], 30 , 'First Contract employee' , accounts[3] , accounts[4])
    }).then(function(firstcontract) {
      console.log("serdfcgvhbjncgvbncgvbngvhb")
      console.log(firstcontract)
      // console.log(accounts[4])
      // assert.equal(employers[1], 'Employee 1');
      return refundInstance.Create_contract_data([878474,3067564],[4882834,325644664], 30 , 'Second Contract employee' , accounts[3] , accounts[4])
    }).then(function(contract) {
      console.log("contarscdggdhfjfjferferfef")
      // console.log(employers)
      console.log(accounts[4])
      return refundInstance.Contractcount()
  }).then(function(data) {
    console.log("rtririeiieiee")
    console.log(data)
    // console.log(accounts[4])
    return refundInstance.contracts(accounts[3])
  }).then(function(contracts) {
    console.log(contracts)
    // return refundInstance.contracts(2)
  // }).then(function(contracts_2) {
  //   console.log(contracts_2)
  })
})

  // it("it initializes the candidates with the correct values", function() {
  //   return Election.deployed().then(function(instance) {
  //     electionInstance = instance;
  //     return electionInstance.candidates(1);
  //   }).then(function(candidate) {
  //     assert.equal(candidate[0], 1, "contains the correct id");
  //     assert.equal(candidate[1], "Candidate 1", "contains the correct name");
  //     assert.equal(candidate[2], 0, "contains the correct votes count");
  //     return electionInstance.candidates(2);
  //   }).then(function(candidate) {
  //     assert.equal(candidate[0], 2, "contains the correct id");
  //     assert.equal(candidate[1], "Candidate 2", "contains the correct name");
  //     assert.equal(candidate[2], 0, "contains the correct votes count");
  //   });
  // });

  // it("allows a voter to cast a vote", function() {
  //   return Election.deployed().then(function(instance) {
  //     electionInstance = instance;
  //     candidateId = 1;
  //     return electionInstance.vote(candidateId, { from: accounts[0] });
  //   }).then(function(receipt) {
  //     assert.equal(receipt.logs.length, 1, "an event was triggered");
  //     assert.equal(receipt.logs[0].event, "votedEvent", "the event type is correct");
  //     assert.equal(receipt.logs[0].args._candidateId.toNumber(), candidateId, "the candidate id is correct");
  //     return electionInstance.voters(accounts[0]);
  //   }).then(function(voted) {
  //     assert(voted, "the voter was marked as voted");
  //     return electionInstance.candidates(candidateId);
  //   }).then(function(candidate) {
  //     var voteCount = candidate[2];
  //     assert.equal(voteCount, 1, "increments the candidate's vote count");
  //   })
  // });

  // it("throws an exception for invalid candiates", function() {
  //   return Election.deployed().then(function(instance) {
  //     electionInstance = instance;
  //     return electionInstance.vote(99, { from: accounts[1] })
  //   }).then(assert.fail).catch(function(error) {
  //     assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
  //     return electionInstance.candidates(1);
  //   }).then(function(candidate1) {
  //     var voteCount = candidate1[2];
  //     assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
  //     return electionInstance.candidates(2);
  //   }).then(function(candidate2) {
  //     var voteCount = candidate2[2];
  //     assert.equal(voteCount, 0, "candidate 2 did not receive any votes");
  //   });
  // });

  // it("throws an exception for double voting", function() {
  //   return Election.deployed().then(function(instance) {
  //     electionInstance = instance;
  //     candidateId = 2;
  //     electionInstance.vote(candidateId, { from: accounts[1] });
  //     return electionInstance.candidates(candidateId);
  //   }).then(function(candidate) {
  //     var voteCount = candidate[2];
  //     assert.equal(voteCount, 1, "accepts first vote");
  //     // Try to vote again
  //     return electionInstance.vote(candidateId, { from: accounts[1] });
  //   }).then(assert.fail).catch(function(error) {
  //     assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
  //     return electionInstance.candidates(1);
  //   }).then(function(candidate1) {
  //     var voteCount = candidate1[2];
  //     assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
  //     return electionInstance.candidates(2);
  //   }).then(function(candidate2) {
  //     var voteCount = candidate2[2];
  //     assert.equal(voteCount, 1, "candidate 2 did not receive any votes");
  //   });
  // });
})