/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const Bool viewontag         = True;     /* Switch view on tag switch */
/* static const char *fonts[]          = { "monospace:size=13" }; */
/* static const char *fonts[]	    = { "Liberation Mono:pixelsize=20:antialias=true:autohint=true" }; */
/* static const char dmenufont[]       = "monospace:size=15"; */
static const char *fonts[]	    = { "hack:pixelsize=20:antialias=true:autohint=true" };
static const char dmenufont[]       = "hack:size=15:antialias=true:autohint=true";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", "-e", "tmux", "new", NULL };
const char *spcmd2[] = {"st", "-n", "spfm", "-g", "144x41", "-e", "tmux", "new", NULL };
const char *spcmd3[] = {"keepassxc", NULL };
const char *spcmd4[] = {"st", "-n", "spmath", "-g", "144x41", "-e", "tmux", "new", "python3", NULL};
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
	{"keepassxc",   spcmd3},
	{"spmath",   	spcmd4},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     NULL,       NULL,   0,          0,            1,           -1,       50,50,500,500,      5 },
	{ "Firefox",  NULL,       NULL,   1 << 1,     0,            0,           -1,       50,50,500,500,      5 },
	{ "Brave-browser", NULL,  NULL,   1 << 1,     0,            0,           -1,       50,50,500,500,      5 },
	{ "qtqr",     NULL,    	  NULL,   0,          0,            1,           -1,       50,50,500,500,      5 },  
	{ "Gedit",    NULL,    	  NULL,   0,          0,            1,           -1,       50,50,500,500,      5 },
	/* { "Godot",    NULL,     	NULL,   0,          1,            1,           -1,       50,50,1366,768,     1 }, */
	{ "Godot",   "Godot_Editor", 	  NULL,   0,          1,            1,           -1,       -50,0,1280,800,     1 },
	{ "Godot",   "Godot_ProjectList", NULL,   0,          1,            1,           -1,  -50,0,1024,600,     1 },
  // Godot_ProjectList
  // Godot_Editor
  // Godot_Engine
	{ NULL,		  "spterm",     NULL,	  SPTAG(0),	0,         1,     -1,       50,50,600,500,      5 },
	{ NULL,		  "spfm",       NULL,	  SPTAG(1),	0,         1,     -1,       1000,50,500,500,    5 },
	{ NULL,		  "keepassxc",  NULL,	  SPTAG(2),	0,         1,     -1,       1118,678,800,400,   5 },
	{ NULL,		  "spmath",     NULL,	  SPTAG(3),	0,         1,     -1,       1000,785,800,200,   5 },

};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", "tmux", NULL };
static const char *layoutmenu_cmd = "layoutmenu.sh";


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_d,      spawn,          SHCMD("rofi -show drun -theme .config/rofi/solarized-black -show-icons") },
	{ MODKEY,                       XK_e, 	   spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_v,      spawn,          SHCMD("bash csr.sh") },
	{ 0,                            XK_Print,  spawn,          SHCMD("scrot ~/Pictures/$(date '+%y%m%d-%H%M-%S').png") },
	{ MODKEY,                       XK_q,  	   spawn,          SHCMD("flameshot gui -p ~/Pictures/") },
	{ MODKEY,                       XK_w,      spawn,          SHCMD("brave") },
	{ MODKEY,                       XK_F2,     spawn,          SHCMD("bash mounting.sh") },
	{ MODKEY,                       XK_F1, 	   spawn,          SHCMD("clipmenu") },
	/* { MODKEY,                       XK_Insert, spawn,          SHCMD("clipmenu") }, */
	{ MODKEY,                       XK_x,      spawn,          SHCMD("xkill") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_space,  setlayout,      {0} },
	{ MODKEY,                       XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,            		XK_r,  	   togglescratch,  {.ui = 0 } },
	{ MODKEY,            		XK_u,  	   togglescratch,  {.ui = 1 } },
	{ MODKEY,            		XK_z,	   togglescratch,  {.ui = 2 } },
	{ MODKEY,            		XK_n,	   togglescratch,  {.ui = 3 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY,                       XK_Escape, spawn,          SHCMD("bash poweroff.sh") },
	{ MODKEY|ShiftMask,             XK_r,      quit,           {1} }, // Restart dwm
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        layoutmenu,     {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	// { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkStatusText,        0,              Button3,        layoutmenu,     {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

