/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"MartianMono Nerd Font:size=11"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#839496", "#002b36"},
    [SchemeSel] = {"#fdf6e3", "#586e75"},
    [SchemeSelHighlight] = {"#b58900", "#586e75"},
    [SchemeNormHighlight] = {"#b58900", "#002b36"},
    [SchemeOut] = {"#073642", "#2aa198"},
    [SchemeOutHighlight] = {"#b58900", "#2aa198"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
