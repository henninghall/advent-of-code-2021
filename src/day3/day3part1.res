let inputs = Utils.readStrings("./src/day3/input.txt")

let initialCount = Belt.Array.make(String.length(inputs[0]), 0)

let bitSum = Belt.Array.reduce(inputs, initialCount, (acc, binaryNumber) => {
  for i in 0 to String.length(binaryNumber) - 1 {
    let char = Js.String.charAt(i, binaryNumber)
    let value = Belt.Option.getExn(Belt.Int.fromString(char))
    acc[i] = acc[i] + value
  }
  acc
})

let gamma = Belt.Array.map(bitSum, value => {
  value > Js.Array.length(inputs) / 2 ? 0 : 1
})
let gammaString = Js.Array.joinWith("", gamma)
let gammaDecimal = Utils.parseInteger(gammaString, 2)

let epsilon = Belt.Array.map(bitSum, value => {
  value > Js.Array.length(inputs) / 2 ? 1 : 0
})
let epsilonString = Js.Array.joinWith("", epsilon)
let epsilonDecimal = Utils.parseInteger(epsilonString, 2)

Js.log(epsilonDecimal * gammaDecimal)
