/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"FantasqueSansM Nerd Font:size=12",
                              "SF Mono:size=12"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#ebdbb2", "#1d2021"},
    [SchemeSel] = {"#d79921", "#3c3836"},
    [SchemeSelHighlight] = {"#b8bb26", "#3c3836"},
    [SchemeNormHighlight] = {"#b8bb26", "#1d2021"},
    [SchemeOut] = {"#282828", "#83a598"},
    [SchemeOutHighlight] = {"#fe8019", "#83a598"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
