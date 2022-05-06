# Color

Color package for Hare (harelang.org) like [chalk.js](https://github.com/chalk/chalk) or [Go Colors](https://github.com/fatih/color) to color your terminal output using ASCI escape codes.

```ha
use fmt;
use color;

export fn main() void = {
    fmt::println!(color::underline(color::red("Hello, world!)))!;
};

```

![red underlined text](https://i.ibb.co/gdqwn0G/image.png)

