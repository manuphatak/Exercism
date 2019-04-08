/* see https://ramdajs.com/docs/#converge
 */
let converge2 = (fn, (ap1, ap2), data) => fn(ap1(data), ap2(data));
let toLetters = word =>
  word
  |> Js.String.toLowerCase
  |> Js.String.replaceByRe([%re "/[^a-z]/"], "")
  |> Js.String.split("")
  |> Array.to_list;

let is_isogram = word =>
  word
  |> toLetters
  |> converge2((==), (List.sort(compare), List.sort_uniq(compare)));