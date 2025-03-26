static const unsigned int borderpx       = 1;  /* border pixel of windows */
static const unsigned int snap           = 32; /* snap pixel */
static const unsigned int gappih         = 0;  /* horiz inner gap between windows */
static const unsigned int gappiv         = 0;  /* vert inner gap between windows */
static const unsigned int gappoh         = 0;  /* horiz outer gap between windows and screen edge */
static const unsigned int gappov         = 0;  /* vert outer gap between windows and screen edge */
static int smartgaps                     = 0;  /* 1 means no outer gap when there is only one window */
static const int swallowfloating         = 1;  /* 1 means swallow floating windows by default */
static const unsigned int systraypinning = 0;  /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;  /* systray spacing */
static const int systraypinningfailfirst = 1;  /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray             = 1;  /* 0 means no systray */
static const int showbar                 = 1;  /* 0 means no bar */
static const int topbar                  = 1;  /* 0 means bottom bar */

static const char *fonts[] = {
    "MartianMono NF:size=11:antialias=true:autohint=true",
    "Font Awesome 6 Free Solid:size=13",
    "Noto Emoji:size=2:antialias=true:autohint=true",
    "JoyPixels:pixelsize-10:antialias=true:autohint=true"};
static const char dmenufont[] = "MartianMono NF:size=12";

// Gruvbox
static const char col_gray1[] = "#1d2021"; // Background color
static const char col_gray2[] = "#3c3836"; // Inactive window border
static const char col_gray3[] = "#ebddb2"; // Text color
static const char col_gray4[] = "#ebddb2"; // Active window text color
static const char col_skin1[] = "#504945"; // Selected window background
static const char col_skin2[] = "#504945"; // Selected window border
static const char col_skin3[] = "#7c6f64"; // Selected window border

static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {col_gray3, col_gray1, col_gray2}, // Normal scheme
    [SchemeSel]  = {col_gray4, col_skin1, col_skin3}, // Selected scheme
};

typedef struct
{
    const char *name;
    const void *cmd;
} Sp;

const char *spcmd1[] = {"st", "-n", "sptop", "-g", "160x44+260-100", "-e", "btop", NULL};
const char *spcmd2[] = {"st", "-n", "spterm", "-g", "120x30+260-100", NULL};
const char *spcmd3[] = {"blueman-manager", NULL};
const char *spcmd4[] = {"pavucontrol", NULL};

static Sp scratchpads[] = {
    {"sptop", spcmd1},
    {"spterm", spcmd2},
    {"spblueman", spcmd3},
    {"spaudio", spcmd4},
};

/* static const char *tags[] = {"WWW", "VIM", "LIV", "TER", "DIR", "RAN", "REC", "DIS", "MUS"}; */
/* static const char *tags[] = {"α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι"}; */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class, instance, title, tags mask, isfloating, isterminal, noswallow,  monitor */
    {"discord", NULL, NULL, 1 << 7, 0, 0, 1, -1},
    {"Spotify", NULL, NULL, 1 << 8, 0, 0, 1, -1},
    {"Slack", NULL, NULL, 1 << 7, 0, 0, 1, -1},
    {"zoom", NULL, NULL, 1 << 6, 1, 0, 1, -1},
    {NULL, NULL, "Event Tester", 0, 0, 0, 1, -1}, /* xev */
    {NULL, "sptop", NULL, SPTAG(0), 1, 1, 0, -1},
    {NULL, "spterm", NULL, SPTAG(1), 1, 0, 1, -1},
    {NULL, "blueman-manager", NULL, SPTAG(2), 1, 0, 1, -1},
    {NULL, "pavucontrol", NULL, SPTAG(3), 1, 0, 0, -1},
};

static const float mfact        = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1
#include "vanitygaps.c"

static const Layout layouts[] = {
    {"[]=", tile},
    {"><>", NULL},
    {"|M|", monocle},
    {"[D]", deck},
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                          \
    {MODKEY, KEY, view, {.ui = 1 << TAG}},                         \
        {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, \
        {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},          \
        {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

#define SHCMD(cmd)                                            \
    {                                                         \
        .v = (const char *[]) { "/bin/zsh", "-c", cmd, NULL } \
    }

static char dmenumon[2]              = "0";
static const char *dmenucmd[]        = {"env", "LANG=en_US.UTF-8", "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_skin2, "-sf", col_gray4, NULL};
static const char *dmenucmddesktop[] = {"env", "LANG=en_US.UTF-8", "dmenu_run_desktop", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_skin2, "-sf", col_gray4, NULL};
static const char *termcmd[]         = {"st", "-g", "140x35+280-120", NULL};
static const char *browsercmd[]      = {"zen", NULL};

#include <X11/XF86keysym.h>

static Key keys[] = {
    /* modifier, key, function, argument */
    {MODKEY, XK_space, spawn, {.v = dmenucmd}},
    {MODKEY | ShiftMask, XK_space, spawn, {.v = dmenucmddesktop}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_f, spawn, {.v = browsercmd}},
    {MODKEY | ShiftMask, XK_c, spawn, SHCMD("killall dwm")},
    {ControlMask | ShiftMask, XK_p, spawn, SHCMD("zen --private-window")},
    {Mod1Mask, XK_0, spawn, SHCMD("pcmanfm")},
    {Mod1Mask, XK_9, spawn, SHCMD("slock")},

    /*{ControlMask, XK_1, togglescratch, {.ui = 0}},*/
    {ControlMask, XK_2, togglescratch, {.ui = 1}},
    {ControlMask, XK_3, togglescratch, {.ui = 2}},
    {ControlMask, XK_4, togglescratch, {.ui = 3}},

    {MODKEY, XK_Print, spawn, SHCMD("echo 'Print Key Pressed' > /tmp/key.log; flameshot screen --path /home/ninjafire/Pictures/Screenshots/")},
    {0, XF86XK_AudioMute, spawn, SHCMD("wpctl set-mute @DEFAULT_SINK@ toggle")},
    {0, XF86XK_AudioRaiseVolume, spawn, SHCMD("wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+")},
    {0, XF86XK_AudioLowerVolume, spawn, SHCMD("wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-")},
    {0, XF86XK_MonBrightnessDown, spawn, SHCMD("brightnessctl set 10%-")},
    {0, XF86XK_MonBrightnessUp, spawn, SHCMD("brightnessctl set 10%+")},

    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},

    {MODKEY | ShiftMask, XK_J, pushdown, {0}},
    {MODKEY | ShiftMask, XK_K, pushup, {0}},

    {MODKEY, XK_i, focusmaster, {0}},
    {MODKEY, XK_s, togglesticky, {0}},

    {MODKEY | ControlMask, XK_o, incnmaster, {.i = +1}},
    {MODKEY | ControlMask, XK_u, incnmaster, {.i = -1}},

    {MODKEY, XK_h, setmfact, {.f = -0.02}},
    {MODKEY, XK_l, setmfact, {.f = +0.02}},

    {MODKEY, XK_backslash, zoom, {0}},

    {MODKEY | Mod1Mask, XK_u, incrgaps, {.i = +2}},
    {MODKEY | Mod1Mask | ShiftMask, XK_u, incrgaps, {.i = -2}},

    {MODKEY | Mod1Mask, XK_i, incrigaps, {.i = +3}},
    {MODKEY | Mod1Mask | ShiftMask, XK_i, incrigaps, {.i = -3}},

    {MODKEY | Mod1Mask, XK_o, incrogaps, {.i = +2}},
    {MODKEY | Mod1Mask | ShiftMask, XK_o, incrogaps, {.i = -2}},

    {MODKEY | Mod1Mask, XK_6, incrihgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_6, incrihgaps, {.i = -1}},

    {MODKEY | Mod1Mask, XK_7, incrivgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_7, incrivgaps, {.i = -1}},

    {MODKEY | Mod1Mask, XK_8, incrohgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_8, incrohgaps, {.i = -1}},

    {MODKEY | Mod1Mask, XK_9, incrovgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_9, incrovgaps, {.i = -1}},

    {MODKEY | ShiftMask, XK_g, togglegaps, {0}},
    {MODKEY | Mod1Mask, XK_0, defaultgaps, {0}},

    {MODKEY, XK_Tab, view, {0}},

    {MODKEY | ShiftMask, XK_l, shiftviewclients, {.i = +1}},
    {MODKEY | ShiftMask, XK_h, shiftviewclients, {.i = -1}},

    {MODKEY, XK_w, killclient, {0}},

    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_e, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_g, setlayout, {.v = &layouts[3]}},

    {MODKEY | ShiftMask, XK_e, togglefloating, {0}},
    {MODKEY | ShiftMask, XK_f, togglefullscreen, {0}},

    {MODKEY, XK_0, view, {.ui = ~0}},

    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},

    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},

    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},

    {MODKEY | ShiftMask, XK_r, quit, {0}},
    TAGKEYS(XK_1, 0)
        TAGKEYS(XK_2, 1)
            TAGKEYS(XK_3, 2)
                TAGKEYS(XK_4, 3)
                    TAGKEYS(XK_5, 4)
                        TAGKEYS(XK_6, 5)
                            TAGKEYS(XK_7, 6)
                                TAGKEYS(XK_8, 7)
                                    TAGKEYS(XK_9, 8)};

static Button buttons[] = {
    /* click                event mask      button          function        argument */
    {ClkLtSymbol, 0, Button4, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
