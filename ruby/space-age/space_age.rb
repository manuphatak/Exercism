class SpaceAge
  EARTH_YEAR = 31_557_600.0

  ORBITAL_PERIOD = {
    on_earth: 1,
    on_mercury: 0.2408467,
    on_venus: 0.61519726,
    on_mars: 1.8808158,
    on_jupiter: 11.862615,
    on_saturn: 29.447498,
    on_uranus: 84.016846,
    on_neptune: 164.79132
  }.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  private

  def respond_to_missing?(name)
    ORBITAL_PERIOD.key?(name)
  end

  def method_missing(name)
    if respond_to_missing?(name)
      @seconds / (EARTH_YEAR * ORBITAL_PERIOD[name])
    else
      super
    end
  end
end
