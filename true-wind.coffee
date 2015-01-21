math = require 'mathjs'

# degrees to radians
deg2rad = (degrees) ->
  degrees * (Math.PI/180)

# radians to degrees
rad2deg = (radians) ->
  radians * (180/Math.PI)

# Wind Speed Calculator
# http://davidburchnavigation.blogspot.com/2013/04/true-true-wind-from-apparent-wind.html
# http://www.sailingcourse.com/keelboat/true_wind_calculator.htm
module.exports = (obj) ->
  # awd = Apparent Wind Direction (relative to true north)
  # awa = Apparent Wind Angle (relative to bow)
  # aws = Apparent Wind Speed (relative to the boat)
  # speed = Vessel Speed
  {speed, heading, awd, awa, aws} = obj

  if awa and heading and awd
    console.log 'awa is overriding awd and heading. twd output value will be invalid.'

  # Get ship's speed (relative to water or GPS COG).
  speed = parseFloat speed
  if awa
    # Difference Between Heading and Apparent Wind Direction.
    # Apparent Wind awa (relative to the bow, 0 to 180, starboard plus, port minus)
    awa = parseFloat awa
    if heading
      awd = awa+heading
  else if heading and awd
    # Ship heading (relative to true north).
    heading = parseFloat heading
    # Apparent Wind Direction (relative to true north)
    awd = parseFloat awd
    if awd < heading then awd += 360
    awa = awd - heading

  # Get awa and convert to radians
  if isNaN(awa)
    console.log "Please supply a valid value for Difference Between Heading and Apparent Wind Direction"
    return

  # Get apparent wind speed.
  aws = parseFloat(aws)
  if isNaN(aws)
    console.log "Please supply a valid value for Apparent Wind Speed"
    return

  if isNaN(speed)
    console.log "The Ship's Speed must be specified if the Apparent\n" + "Wind Speed is specified in knots."
    return

  # Convert to radians.
  awa = deg2rad(awa)

  # Convert apparent wind speed to units of ships speed.
  aws = aws / speed

  # Calculate true heading diff and true wind speed
  tanAlpha = (Math.sin(awa) / (aws - Math.cos(awa)))
  alpha = Math.atan(tanAlpha)
  tdiff = rad2deg(awa + alpha)
  tspeed = Math.sin(awa) / Math.sin(alpha)

  if heading
    twd = math.round tdiff+heading, 2
    if twd > 360 then twd -= 360

  return {
    tanAlpha: math.round tanAlpha, 5
    alpha: math.round alpha, 5
    twa: math.round tdiff, 2
    twd: twd
    twsr: math.round tspeed, 2
    tws: math.round (tspeed * speed), 2
  }

console.log(module.exports {speed: 6.5, heading: 20, awd: 50, aws: 15})
