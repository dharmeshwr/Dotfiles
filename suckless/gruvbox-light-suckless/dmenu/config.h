/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"MartianMono Nerd Font:size=12"};

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#3c3836", "#fbf1c7"},
    [SchemeSel] = {"#fbf1c7", "#458588"},
    [SchemeSelHighlight] = {"#fbf1c7", "#458588"},
    [SchemeNormHighlight] = {"#cc241d", "#fbf1c7"},
    [SchemeOut] = {"#fbf1c7", "#8ec07c"},
    [SchemeOutHighlight] = {"#fbf1c7", "#8ec07c"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
