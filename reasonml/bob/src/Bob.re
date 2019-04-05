let both = (fn1, fn2, data) => fn1(data) && fn2(data);
let equals = (fn1, fn2, data) => fn1(data) == fn2(data);
let identity = x => x;
let not = (fn, data) => !fn(data);
let always = (x, _) => x;

let isQuestion = Js.String.endsWith("?");
let isUpperCase = equals(Js.String.toUpperCase, identity);
let notLowerCase = equals(Js.String.toLowerCase, identity) |> not;
let isShouting = both(isUpperCase, notLowerCase);
let isShoutingQuestion = both(isShouting, isQuestion);
let isEmpty = equals(always(0), Js.String.length);

let response = input =>
  switch (input) {
  | _ when isEmpty(input) => "Fine. Be that way!"
  | _ when isShoutingQuestion(input) => "Calm down, I know what I'm doing!"
  | _ when isQuestion(input) => "Sure."
  | _ when isShouting(input) => "Whoa, chill out!"
  | _ => "Whatever."
  };

let hey = input => input->Js.String.trim->response;