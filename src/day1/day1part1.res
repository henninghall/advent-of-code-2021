let inputs = Utils.readInts("./src/day1/input.txt")

let largerValues = Belt.Array.reduceWithIndex(inputs, 0, (sum, value, index) => {
  if index === 0 {
    sum
  } else {
    let previousValue = inputs[index - 1]
    let toAdd = value > previousValue ? 1 : 0
    sum + toAdd
  }
})

Js.log(largerValues)
