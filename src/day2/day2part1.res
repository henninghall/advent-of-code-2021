let inputs = Utils.readStrings("./src/day2/input.txt")

let result = Belt.Array.reduce(inputs, {"horizontal": 0, "depth": 0}, (acc, value) => {
  let [direction, distanceString] = Js.String.split(" ", value)
  let distance = Belt.Option.getExn(Belt.Int.fromString(distanceString))
  let currentHorizontal = direction === "forward" ? distance : 0
  let currentDepth = switch direction {
  | "down" => distance
  | "up" => distance * -1
  | _ => 0
  }
  {"horizontal": acc["horizontal"] + currentHorizontal, "depth": acc["depth"] + currentDepth}
})

Js.log(result["horizontal"] * result["depth"])
