# True wind calculator

Calculate true wind direction speed from vessel speed, apparent wind direction and speed.

## truewind(options)

The first argument is an options object.
{speed: 6.5, heading: 200, awd: 350, aws: 5, awa: 150}

* `speed` - Vessel Speed
* `heading` - Vessel True Heading
* `awd` - Apparent Wind Direction (0-360) (relative to true north)
* `awa` - Apparent Wind Angle (0-360) (relative to bow) **Overrides `awd` and `heading` options.**
* `aws` - Apparent Wind Speed (relative to the boat). _Units must match `speed` option._

### Returns {}

Each value is rounded to nearest hundredth.

* `twa` - True Wind Angle
* `twd` - True Wind Direction (Requires `heading` and `awd` input.)
* `twsr` - True Wind Speed as a ratio to `speed` input.
* `tws` - True Wind Speed in units as sent to function.

```javascript
var truewind = require('truewind');

var ops = {
  speed: 6.5, heading: 200, awd: 350, aws: 5
};

var res = truewind(ops); // { twa: 167, twd: 367, twsr: 1.71, tws: 11.11 }

```
