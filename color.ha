// License: MIT
// (c) 2022 Tristan Isham <tristan@isham.co>
use strings;

type foreground = enum {
    BLACK,
    DARKRED,
    DARKGREEN,
    DARKYELLOW,
    DARKBLUE,
    DARKMAGENTA,
    DARKCYAN,
    LIGHTGRAY,
    DARKGRAY,
    LIGHTRED,
    LIGHTGREEN,
    LIGHTYELLOW,
    LIGHTBLUE,
    LIGHTMAGENTA,
    LIGHTCYAN,
    WHITE,
};

type background = enum {
    BLACK,
    DARKRED,
    DARKGREEN,
    DARKYELLOW,
    DARKBLUE,
    DARKMAGENTA,
    DARKCYAN,
    LIGHTGRAY,
    DARKGRAY,
    LIGHTRED,
    LIGHTGREEN,
    LIGHTYELLOW,
    LIGHTBLUE,
    LIGHTMAGENTA,
    LIGHTCYAN,
    WHITE,
};

type format = enum {
    BOLD,
    UNDERLINE,
    NOUNDERLINE,
    REVERSETEXT,
    POSITIVETEXT,
};

const reset: str = "\x1b[0m";

type color = (format | background | foreground);

fn get_color(c: color) str = {
    return match (c) {
        case format => yield format_code(c as format);
        case background => yield background_code(c as background);
        case foreground => yield foreground_code(c as foreground);
    };
};

fn format_code(f: format) str = {
    let code: str = switch (f) {
        case format::BOLD => yield "1";
        case format::UNDERLINE => yield "4";
        case format::NOUNDERLINE => yield "24";
        case format::REVERSETEXT => yield "7";
        case format::POSITIVETEXT => yield "27";
    };

    return code;
};

fn background_code(b: background) str = {
    let code: str = switch (b) {
        case background::BLACK => yield "40";
        case background::DARKRED => yield "41";
        case background::DARKGREEN => yield "42"; 
        case background::DARKYELLOW => yield "43";    
        case background::DARKBLUE => yield "44";
        case background::DARKCYAN => yield  "46"; 
        case background::LIGHTGRAY => yield  "100"; 
        case background::LIGHTRED => yield "101"; 
        case background::LIGHTGREEN => yield "102";
        case background::LIGHTYELLOW => yield "103";
        case background::LIGHTBLUE => yield "104";
        case background::LIGHTMAGENTA => yield "105";
        case background::LIGHTCYAN => yield "107";
    };
    return code;
};

fn foreground_code(f: foreground) str = {
    let code: str = switch (f) {
        case foreground::BLACK => yield "30";
        case foreground::DARKRED => yield "31";
        case foreground::DARKGREEN => yield "32";
        case foreground::DARKYELLOW => yield "33";
        case foreground::DARKBLUE => yield "34";
        case foreground::DARKMAGENTA => yield "35";
        case foreground::DARKCYAN => yield "36";
        case foreground::LIGHTGRAY => yield "37";
        case foreground::DARKGRAY => yield "90";
        case foreground::LIGHTRED => yield "91";
        case foreground::LIGHTGREEN => yield "92";
        case foreground::LIGHTYELLOW => yield "93";
        case foreground::LIGHTBLUE => yield "94";
        case foreground::LIGHTMAGENTA => yield "95";
        case foreground::LIGHTCYAN => yield "96";
        case foreground::WHITE => yield "97";
    };
    return code;
};

// Foreground

export fn green(f: str...) str = {
    return write(foreground::DARKGREEN, f...);
};
export fn black(f: str...) str = {
    return write(foreground::BLACK, f...);
};

export fn red(f: str...) str = {
    return write(foreground::DARKRED, f...);
};
export fn yellow(f: str...) str = {
    return write(foreground::DARKYELLOW, f...);
};
export fn blue(f: str...) str = {
    return write(foreground::DARKBLUE, f...);
};
export fn magenta(f: str...) str = {
    return write(foreground::DARKMAGENTA, f...);
};
export fn cyan(f: str...) str = {
    return write(foreground::DARKCYAN, f...);
};
export fn gray(f: str...) str = {
    return write(foreground::DARKGRAY, f...);
};

export fn lightgray(f: str...) str = {
    return write(foreground::LIGHTGRAY, f...);
};
export fn lightgreen(f: str...) str = {
    return write(foreground::LIGHTGREEN, f...);
};

export fn lightyellow(f: str...) str = {
    return write(foreground::LIGHTYELLOW, f...);
};
export fn lightblue(f: str...) str = {
    return write(foreground::LIGHTBLUE, f...);
};
export fn lightmagenta(f: str...) str = {
    return write(foreground::LIGHTMAGENTA, f...);
};

export fn lightcyan(f: str...) str = {
    return write(foreground::LIGHTCYAN, f...);
};

export fn white(f: str...) str = {
    return write(foreground::WHITE, f...);
};

// Background
export fn bg_black(f: str...) str = {
    return write(background::BLACK, f...);
};

export fn bg_red(f: str...) str = {
    return write(background::DARKRED, f...);
};

export fn bg_green(f: str...) str = {
    return write(background::DARKGREEN, f...);
};

export fn bg_yellow(f: str...) str = {
    return write(background::DARKYELLOW, f...);
};

export fn bg_blue(f: str...) str = {
    return write(background::DARKBLUE, f...);
};

export fn bg_cyan(f: str...) str = {
    return write(background::DARKCYAN, f...);
};

export fn bg_lightgray(f: str...) str = {
    return write(background::LIGHTGRAY, f...);
};

export fn bg_lightred(f: str...) str = {
    return write(background::LIGHTRED, f...);
};

export fn bg_lightgreen(f: str...) str = {
    return write(background::LIGHTGREEN, f...);
};

export fn bg_lightyellow(f: str...) str = {
    return write(background::LIGHTYELLOW, f...);
};

export fn bg_lightblue(f: str...) str = {
    return write(background::LIGHTBLUE, f...);
};

export fn bg_lightmagenta(f: str...) str = {
    return write(background::LIGHTMAGENTA, f...);
};

export fn bg_lightcyan(f: str...) str = {
    return write(background::LIGHTCYAN, f...);
};

// FORMAT

export fn bold(f: str...) str = {
    return write(format::BOLD, f...);
};

export fn underline(f: str...) str = {
    return write(format::UNDERLINE, f...);
};

export fn no_underline(f: str...) str = {
    return write(format::NOUNDERLINE, f...);
};

export fn reverse(f: str...) str = {
    return write(format::REVERSETEXT, f...);
};

export fn forward(f: str...) str = {
    return write(format::POSITIVETEXT, f...);
};

// write takes a provided color and string slice and returns a color-coded str the caller must free.
fn write(c: color, f: str...) str = {
    let clr = get_color(c);
    let raw: []str = [];
    append(raw, "\x1b[");
    append(raw, clr);
    append(raw, "m");
    append(raw, f...);
    append(raw, reset);
     
    return strings::concat(raw...);
};