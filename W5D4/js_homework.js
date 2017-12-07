function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(searchString, subString) {
  return phrase.includes(subString);
}

function fizzBuzz (array) {
  const result = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      result.push(el);
    }
  });
  return result;
}

function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes (n) {
  let sum = 0;
  let numPrimes = 0;
  let i = 2;

  while (numPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      numPrimes++;
    }
    i++;
  }
  return sum;
}
