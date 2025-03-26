/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"MartianMono Nerd Font:size=12"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    // [SchemeNorm] = {"#ebddb2", "#ebddb2"},
    // [SchemeSel] = {"#ebddb2", "#ebddb2"},
    // [SchemeSelHighlight] = {"#b57614", "#ebddb2"},
    // [SchemeNormHighlight] = {"#b57614", "#ebddb2"},
    // [SchemeOut] = {"#ebddb2", "#ebddb2"},
    // [SchemeOutHighlight] = {"#ebddb2", "#ebddb2"},

    // Gruvbox
    [SchemeNorm] = {"#ebdbb2", "#1d2021"},
    [SchemeSel] = {"#d79921", "#3c3836"},
    [SchemeSelHighlight] = {"#b8bb26", "#3c3836"},
    [SchemeNormHighlight] = {"#b8bb26", "#1d2021"},
    [SchemeOut] = {"#282828", "#83a598"},
    [SchemeOutHighlight] = {"#fe8019", "#83a598"},

    // catppuccin mocha
    // [SchemeNorm] = {"#c6d0f5", "#1e1e2e"}, // Normal text on background
    // [SchemeSel] = {"#f4dbd6", "#1e1e2e"},  // Selected text on background
    // [SchemeSelHighlight] =
    //     {"#a6e3a1", "#45475a"}, // Highlighted selected text on background
    // [SchemeNormHighlight] =
    //     {"#a6e3a1", "#1e1e2e"}, // Highlighted normal text on background
    // [SchemeOut] = {"#000000", "#8bd5ca"}, // Output text on teal background
    // [SchemeOutHighlight] =
    //     {"#ffc978", "#8bd5ca"}, // Highlighted output text on teal background
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
