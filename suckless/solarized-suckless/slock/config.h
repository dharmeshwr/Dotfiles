/* user and group to drop privileges to */
static const char *user = "ninjafire";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
    [BACKGROUND] = "#002b36", /* Background color */
    [INIT] = "#839496",       /* After initialization */
    [INPUT] = "#268bd2",      /* During input */
    [FAILED] = "#dc322f",     /* Wrong password (failed) */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

static const int logosize = 75;
static const int logow =
    12; /* Grid width and height for right center alignment*/
static const int logoh = 6;

static XRectangle rectangles[9] = {
    {0, 3, 1, 3}, {1, 3, 2, 1}, {0, 5, 8, 1}, {3, 0, 1, 5},  {5, 3, 1, 2},
    {7, 3, 1, 2}, {8, 3, 4, 1}, {9, 4, 1, 2}, {11, 4, 1, 2},
};

/*Enable blur*/
#define BLUR
/*Set blur radius*/
static const int blurRadius = 5;
/*Enable Pixelation*/
// #define PIXELATION
/*Set pixelation radius*/
static const int pixelSize = 0;
