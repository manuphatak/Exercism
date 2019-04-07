let equalBy = (fn, left, right) => fn(left) == fn(right);
let not = value => !value;

let anagramHash = word =>
  Js.String.toLowerCase(word) |> Js.String.split("") |> Js.Array.sortInPlace;

let isAnagram = (left, right) =>
  equalBy(Js.String.toLowerCase, left, right)
  |> not
  && equalBy(anagramHash, left, right);

let anagrams = (testWord, words) => List.filter(isAnagram(testWord), words);