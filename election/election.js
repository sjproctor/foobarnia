exports.tally = function(votes) {
  // creating an array of unique values to represent each "candidate"
  let candidates = [...new Set(votes)]
  let tally = {}
  // setting each candidate as a key in the tally object with an initial value of 0
  candidates.forEach(value => tally[value] = 0)
  // iterating over the votes and increment the tally for every instance of a candidate
  votes.forEach(value => tally[value] += 1)
  // sort the candidates (keys which are strings) and votes (values which are integers) into an array of arrays in order of most to least votes (the candidate is at index 0 and vote total is at index 1 of each sub array)
  let candidatesAndVotes = Object.entries(tally).sort((a, b) => b[1] - a[1])
  // winner is the first sub array in the set
  let winner = candidatesAndVotes[0]
  // second place is the second sub array in the set
  let secondPlace = candidatesAndVotes[1]
  // third place is the third sub array in the set
  let thirdPlace = candidatesAndVotes[2]
  // collecting all the instances that are tied with third place that are not already in the top three finishers, if none array will be empty
  let candidatesTiedWithThird = candidatesAndVotes.filter(value => value[1] === thirdPlace[1] && value !== winner && value !== secondPlace && value !== thirdPlace)
  // extracting only the candidate from the set of subarrays and changing the key/string into a integer
  let multipleThirds = candidatesTiedWithThird.map(value => parseInt(value[0]))
  // adding the winner, second, third, and any third place ties into a single array
  let runOff = [parseInt(winner[0]), parseInt(secondPlace[0]), parseInt(thirdPlace[0])].concat(multipleThirds)
  // if the votes for the winner (index 1) of the sub array are more than 51% of the total votes return the candidate (index 0) of the sub array changing the key/string into a integer
  if(winner[1] >= votes.length/2){
    return [parseInt(winner[0])]
  } else {
    // if there is not a majority return all candidates for the runoff and sort in order of candidate number rather than finishing position due to the test requirement
    return runOff.sort((a, b) => a - b)
  }
}
