let scan = (re, string) =>
  Js.String.match(re, string)
  ->(
      fun
      | None => ""
      | Some(array) => Js.Array.joinWith(" ", array)
    );

let increment = (dict, word) => {
  Js.Dict.set(
    dict,
    word,
    switch (Js.Dict.get(dict, word)) {
    | None => 1
    | Some(count) => count + 1
    },
  );

  dict;
};

let wordCount = (phrase: string) =>
  Js.String.toLowerCase(phrase)
  ->scan([%re "/(?:\w|(?<=\w)'(?=\w))+/gm"], _)
  ->Js.String.splitByRe([%re "/\s+/"], _)
  ->Belt.Array.reduce(_, Js.Dict.empty(), increment);