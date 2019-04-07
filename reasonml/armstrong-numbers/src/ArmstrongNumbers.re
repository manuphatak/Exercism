let validate = number => {
  let digits =
    string_of_int(number) |> Js.String.split("") |> Array.map(int_of_string);
  let exp = Js.Array.length(digits);

  Array.fold_left(
    (acc, digit) => acc + Js.Math.pow_int(~base=digit, ~exp),
    0,
    digits,
  )
  == number;
};