let readStrings = path => Node.Fs.readFileAsUtf8Sync(path)->Js.String2.split("\n")

let readInts = path =>
  readStrings(path)
  ->Belt.Array.map(i => Belt.Int.fromString(i))
  ->Belt.Array.map(o => Belt.Option.getExn(o))

let parseInteger = %raw(`
  function parseInteger(number, radix) {
    return parseInt(number, radix)
  }
`)
