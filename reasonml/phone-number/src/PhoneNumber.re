let resultGroup: Js.Re.result => Js.Dict.t(string) = [%raw
  {| function(result) { return result.groups } |}
];

let juxt = (array, data) => Array.map(fn => fn(data), array);
let flip = (fn, a, b) => fn(b, a);
let prop = flip(Js.Dict.get);

let phoneNumber = string =>
  string
  |> flip(
       Js.Re.exec,
       [%re
         "/^[\+1\(\s]*(?<area>[2-9]\d{2})[\)\s\.]*(?<prefix>[2-9]\d{2})[-.\s]*(?<line>\d{4})[\s]*$/g"
       ],
     )
  |> (
    fun
    | None => None
    | Some(result) =>
      result
      ->resultGroup
      ->juxt([|prop("area"), prop("prefix"), prop("line")|], _)
      ->Js.Array.joinWith("", _)
      ->Some
  );