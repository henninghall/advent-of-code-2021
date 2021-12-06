let inputs =
  Node.Fs.readFileAsUtf8Sync("./input.txt")
  ->Js.String2.split("\n")
  ->Belt.Array.map(i => Belt.Int.fromString(i))
  ->Belt.Array.map(o => Belt.Option.getExn(o))

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
