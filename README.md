# Color

Color package for Hare (harelang.org)

```ha
use fmt;

export fn main() void = {
    let fg = underline("Hello, world!");
    let fg = red(fg);
    fmt::println(fg)!;
    free(fg);
};
```