let scan = (re, string) =>
  Js.String.match(re, string)
  ->Belt.Option.getWithDefault(_, [||])
  ->Js.Array.joinWith(" ", _);

let inc = n => n + 1;

let incCount = (dict, word) => {
  Js.Dict.set(
    dict,
    word,
    Js.Dict.get(dict, word)->Belt.Option.getWithDefault(_, 0)->inc,
  );

  dict;
};

let wordCount = (phrase: string) =>
  Js.String.toLowerCase(phrase)
  ->scan([%re "/(?:\w|(?<=\w)'(?=\w))+/gm"], _)
  ->Js.String.splitByRe([%re "/\s+/"], _)
  ->Belt.Array.reduce(_, Js.Dict.empty(), incCount);