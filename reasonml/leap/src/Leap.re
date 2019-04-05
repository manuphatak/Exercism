let isLeapYear = year => {
  let divisibleBy = factor => year mod factor === 0;

  divisibleBy(4) && !divisibleBy(100) || divisibleBy(400);
};