let abbreviate = phrase =>
  Js.String.splitByRe([%re "/[\s-]/"], phrase)
  |> Array.map(Js.String.charAt(0))
  |> Js.Array.joinWith("")
  |> Js.String.toUpperCase;