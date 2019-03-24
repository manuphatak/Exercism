export default class Gigasecond {
  GIGASECOND_IN_MS = 10 ** (9 + 3)
  private readonly startTime: Date

  constructor(startTime: Date) {
    this.startTime = startTime
  }

  date() {
    return new Date(this.startTime.getTime() + this.GIGASECOND_IN_MS)
  }
}
