export default function isLeapYear(year: number) {
  if (isMultipleOf(year, 100) && !isMultipleOf(year, 400)) {
    return false
  }
  return isMultipleOf(year, 4)
}

function isMultipleOf(n: number, factor: number) {
  return n % factor === 0
}
