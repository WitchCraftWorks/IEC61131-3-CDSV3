## Regular Expressions

This is a simple implementation of Regular Expressions. This is by no means a full implementation, and far from PCRE.
Simple matching with wildcard is implemented, for both ANSI (ISO 8859-1), UTF-8 and UTF-16 (WSTRING).
Please also note, this is not a complete Unicode implementation and matching on Codepoints is done in a strict fashion.
Language-specific handling is also not implemented.

Supported are the following quantifiers:

- Wildcard `*` (asterisk):
  Matches zero or more any characters (can be combined with a following question mark `?` to mark the wildcard as "lazy").
  To use a literal asterisk in the pattern, escape the asterisk with a preceding backslash `\`.

- Single character `.` (dot):
  Matches any character (only one), however it MUST match one, if none is found the matching fails.
  To use a literal dot in the pattern, escape the dot with a preceding backslash `\`.

Any other character is taken as literal. The pattern can be marked case insensitive, so the casing does not mattern.

Before a pattern can be used for matching, it must be compiled first. This library provides three (four) different functions, depending on the character set you are working with:

- `FuCompilePattern` - ANSI and ISO 8859-1 compliant strings (such as regular STRING without UTF-8 encoding enabled)

- `FuCompilePatternUTF8` - UTF-8 compliant string (such as regular STRING with UTF-8 encoding enabled, or UTF-8 strings (or byte arrays) coming from the outside)

- `FuCompilePatternW` -  UTF-16 compliant string (such as WSTRING)

- `FuCompilePatternW2` -  Same as `FuCompilePatternW`, however it takes a string instead of a pointer (useful for constant values)

Each of these functions returns a structure (as separate output), which contains a stream of tokens used for matching. Please note, each function stops parsing the pattern once it encounters a NUL byte (`0`).

If compilation was successful, you can now use the structure to match against any string. Each of them takes the compiled pattern structure, a pointer to the string (subject) and the actual string length (subject length).

The following functions are provided, each for a specific character set:

- `FuMatchExpression` - ANSI and ISO 8859-1 compliant strings

- `FuMatchExpressionUTF8` - UTF-8 compliant strings

- `FuMatchExpressionW` - UTF-16 compliant strings (WSTRING)

The UTF-8 version can without any change take ANSI compliant strings. To take ISO 8859-1 compliant strings, you can disable strict Unicode standard conformity, however you need to take care that you are not forming "well-formed" UTF-8 byte sequences, since then they would be interpreted as UTF-8 and not ISO 8859-1.
Strict Unicode standard conformity does not allow 8 bit characters as used by ISO 8859-1, instead these would be encoded differently in a UTF-8 byte sequence. If you're expecting ANSI and/or ISO 8859-1 characters, use the regular functions instead.

For example, you could match on text, such as it needs to include the word "building" and "alarm", in that order, anywhere in the text like this::

```
// Somewhere first compile the pattern before usage (make it case insensitive)
xCompileSuccessful := FuCompilePattern('*building*alarm*', TRUE, typPattern => typCompiledPattern);

// Now on demand, match the compiled pattern against the string
IF xMatchNow THEN
    // FuMatchExpression takes a pointer to the string and the string length
    // This is done so any string length can be supported, without wasting space
    xMatches := FuMatchExpression(typCompiledPattern, ADR(sMyString), udiStringLength);
END_IF

// xMatches will be a boolean indicating whether the string matches or not
```

Matching on strings using wildcards/placeholder and get those matches back is currently not implemented. However for the simple needs of knowing whether the pattern matches or not, this library is currently in its current state enough.