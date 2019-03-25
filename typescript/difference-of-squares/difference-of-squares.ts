const add = (l: number, r: number) => l + r
const range = (length: number) => Array.from(Array(length + 1).keys())

export default class Squares {
  private readonly range: number[]
  constructor(length: number) {
    this.range = range(length)
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
