# Color

Color package for Hare (harelang.org) like [chalk.js](https://github.com/chalk/chalk) or [Go Colors](https://github.com/fatih/color) to color your terminal output using ASCI escape codes.

```ha
use fmt;
use color;

export fn main() void = {
    let fg = color::underline("Hello, world!");
    let fg = color::red(fg);
    fmt::println(fg)!;
    free(fg);
};

```