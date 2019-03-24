let abbreviate = phrase =>
  Js.String.splitByRe([%bs.re "/[\s-]/"], phrase)
  ->Array.map(Js.String.charAt(0), _)
  ->Js.Array.joinWith("", _)
  ->Js.String.toUpperCase;