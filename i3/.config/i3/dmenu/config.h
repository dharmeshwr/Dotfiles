/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 0; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"OverpassM Nerd Font:size=10:"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#cccccc", "#000000"}, // light gray on dark gray
    [SchemeSel] = {"#ffffff",
                   "#3a3a3a"}, // white on medium dark (for selected items)
    [SchemeSelHighlight] = {"#d7af5f",
                            "#3a3a3a"}, // soft yellow on selected background
    [SchemeNormHighlight] = {"#d7af5f",
                             "#1e1e1e"}, // soft yellow highlight on normal bg
    [SchemeOut] = {"#1e1e1e",
                   "#5f87ff"}, // dark fg, blue bg (used for output maybe)
    [SchemeOutHighlight] = {"#afd7ff", "#5f87ff"}, // light blue on blue

};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
