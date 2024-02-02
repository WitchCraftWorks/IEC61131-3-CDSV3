## Math Expression Evaluator

The Math Expression Evaluator evaluates math expressions (terms).

This is done in three steps:

- Tokenize (parse the string into a stream of tokens)

- Stepize (group related tokens and provide "steps" for the evaluator)

- Evaluate (evaluate each step)

All values are using LREAL, as such provided values will be converted to LREAL.

As such you can do basic math such as `5 + 3 + 2` or `5 + \\0 - \2` (`\\` denotes variables), but you can also "group" them using parenthesis `(5 + 3) * 2`.

The following math operators are implemented as symbols:

- ADD `+`

- SUB `-`

- MUL `*`

- DIV `/`

- MOD `%`

All math operators, except for MOD, are implemented for LREAL. MOD will convert all operands to LINT and the result back to LREAL.

A limited amount of functions are implemented, however function calls can not be nested (currently). Most of the implemented functions are IEC 61131-3 functions.

The following functions are provided:

- `ABS(x)`

- `ACOS(x)`

- `ASIN(x)`

- `ATAN(x)`

- `AVG(x, y, ...)` - Calculates the arithmetic average of the provided arguments (2 to 9 inputs)

- `CEIL(x)`

- `COS(x)`

- `DEG(x)` - Turns radians into degrees

- `FLOOR(x)`

- `LIMIT(y, x, z)`

- `LOG(x)`

- `LN(x)`

- `MAX(x, y, ...)` - (2 to 9 inputs)

- `MIN(x, y, ...)` - (2 to 9 inputs)

- `RAD(x)` - Turns degrees into radians

- `ROUND(x)` - Mathematic rounding (.0 - .4 = down, .5 - .9 = up)

- `SIN(x)`

- `SQRT(x)`

- `TAN(x)`

- `TRUNC(x, y)` - Truncates the float to `y` decimals (i.e. `1` = `x.y`, `2` = `x.yy`)

Function calls must be in all uppercase.

There is no implemented limit for user provided variables (since the array is `*`), however during stepize the amount of internal variables will be determined and is configured using ParameterList. You may reach the configured maximum during stepize, but you can raise the limit yourself.

There is also a configured limit for how many tokens can get parsed and how many steps can get produced per expression (operation). You may also need to raise these limits if you're going wild with expressions.