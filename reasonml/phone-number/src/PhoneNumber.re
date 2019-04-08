let rePhoneNumber = [%re
  "/^[\+1\(\s]*([2-9]\d{2})[\)\s\.]*([2-9]\d{2})[-.\s]*(\d{4})[\s]*$/"
];

let phoneNumber = candidate =>
  Js.String.match(rePhoneNumber, candidate)
  ->Belt.Option.map(match => match[1] ++ match[2] ++ match[3]);