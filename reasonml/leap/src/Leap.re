let divisibleBy = (n, factor) => n mod factor === 0;

let isLeapYear = (year) =>
  divisibleBy(year, 4) && !divisibleBy(year, 100) || divisibleBy(year, 400);