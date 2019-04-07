let factorSoundMap = [|(3, "Pling"), (5, "Plang"), (7, "Plong")|];

let raindrops = number =>
  Array.map(
    ((factor, sound)) => number mod factor == 0 ? sound : "",
    factorSoundMap,
  )
  |> Js.Array.joinWith("")
  |> (string => string == "" ? string_of_int(number) : string);