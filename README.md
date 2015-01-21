# True wind calculator

Calculate true wind direction speed from vessel speed, apparent wind direction and speed.

## truewind(options)

The first argument is an options object.
{speed: 6.5, heading: 200, awd: 350, aws: 5, awa: 150}

* `speed` - Vessel Speed
* `heading` - Vessel True Heading
* `awd` - Apparent Wind Direction (0-360) (relative to true north)
* `awa` - Apparent Wind Angle (0-360) (relative to bow) ** Overrides `awd` and `heading` options. **
* `aws` - Apparent Wind Speed (relative to the boat). Units must match `speed` option.


```javascript
var truewind = require('truewind');

var ops = {
  speed: 6.5, heading: 200, awd: 350, aws: 5
};

var res = truewind(ops);

```
