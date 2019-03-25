export default class Words {
  public count(phrase: string) {
    return phrase
      .toLowerCase()
      .trim()
      .split(/\s+/)
      .reduce(incCount, new Map<string, number>())
  }
}

const incCount = (map: Map<string, number>, key: string) => {
  const currentCount = map.get(key) || 0

  return map.set(key, currentCount + 1)
}
