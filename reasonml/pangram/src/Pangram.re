let alphabetSet =
  Belt.Array.range(97, 122)
  |> Array.map(Js.String.fromCharCode)
  |> Belt.Set.String.fromArray;

let isAlphabetSet = Belt.Set.String.eq(alphabetSet);

let toCharacterSet = phrase =>
  phrase
  |> Js.String.toLowerCase
  |> Js.String.replaceByRe([%re "/[^a-z]/g"], "")
  |> Js.String.split("")
  |> Belt.Set.String.fromArray;

let isPangram = phrase => phrase |> toCharacterSet |> isAlphabetSet;