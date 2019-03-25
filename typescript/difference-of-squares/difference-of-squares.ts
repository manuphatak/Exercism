export default class Squares {
  private readonly range: number[]
  constructor(length: number) {
    this.range = Array.from(Array(length + 1).keys())
  }

  get squareOfSum() {
    const sum = this.range.reduce(add, 0)
    return sum ** 2
  }
  get sumOfSquares() {
    const squares = this.range.map((n) => n ** 2)
    return squares.reduce(add, 0)
  }
  get difference() {
    return this.squareOfSum - this.sumOfSquares
  }
}

function add(l: number, r: number) {
  return l + r
}
