export default class Gigasecond {
  GIGASECOND_IN_MS = 10 ** (9 + 3)
  private _date: Date

  constructor(date: Date) {
    this._date = new Date(date.valueOf() + this.GIGASECOND_IN_MS)
  }

  date() {
    return this._date
  }
}
