import os
import subprocess
from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, DropDown, Group, Key, Match, Screen, ScratchPad
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook

mod = "mod4"
terminal = guess_terminal()

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + "/.config/qtile/autostart.sh"])

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "f", lazy.spawn("firefox"), desc="Firefox"),
    Key([mod], "q", lazy.spawn("./.local/bin/powermenu "), desc="Power Options"),
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="Rofi"),
    Key([mod], "c", lazy.spawn("rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"), desc="Clipboard"),

    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# groups = [Group(i) for i in "12345"]
# groups = [ Group('1', label='  '), Group('2', label=' 󰖟 '), Group('3', label=' 󰈤 '), Group('4', label='  '), Group('5', label='  ')] 
groups = [ Group('1', label='I'), Group('2', label='II'), Group('3', label='III'), Group('4', label='IV'), Group('5', label='V')] 

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

groups.append(ScratchPad('scratchpad',[
    DropDown('qute','qutebrowser',width=0.9,height=0.9,x=0.05,y=0.05, opacity=1),
    DropDown('kitty','kitty',width=0.8,height=0.8,x=0.1,y=0.1, opacity=1),
    DropDown('pavu','pavucontrol',width=0.8,height=0.8,x=0.1,y=0.1, opacity=1),
    DropDown('blueman','/usr/bin/python /usr/bin/blueman-manager',width=0.8,height=0.8,x=0.1,y=0.1, opacity=1),
    DropDown('thunar','thunar',width=0.8,height=0.8,x=0.1,y=0.1, opacity=1),
]))

keys.extend([
    Key(['control'],"1",lazy.group['scratchpad'].dropdown_toggle('qute')),
    Key(['control'],"2",lazy.group['scratchpad'].dropdown_toggle('kitty')),
    Key(['control'],"3",lazy.group['scratchpad'].dropdown_toggle('pavu')),
    Key(['control'],"4",lazy.group['scratchpad'].dropdown_toggle('blueman')),
    Key(['control'],"0",lazy.group['scratchpad'].dropdown_toggle('thunar')),
])

layout_options={
    "border_width": 2,
    "margin": 3,
    "border_normal": "#504945",
    "border_focus": "#ebddb2"
}

layouts = [
    layout.Bsp(**layout_options),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadTall(**layout_options),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font bold",
    fontsize=13,
    padding=3,
    background="#1d2021",
    foreground="#ebddb2"
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active="#fbf1c7",
                    inactive="#665c54",
                    fontsize=12,
                    # margin_y=2,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    borderwidth=3,
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    urgent_border="#cc2418",
                    this_current_screen_border="#3c3836",
                    this_screen_border="#3c3836",
                    # other_current_screen_border=self.colors[0],
                    # other_screen_border=self.colors[0],
                    # foreground=self.colors[2],
                    # background=self.colors[0],
                    disable_drag=False
                ),
                widget.Prompt(),
                widget.WindowName(padding=10),
                widget.Systray(),
                widget.Battery(padding=10,format='| {percent:2.0%} |'),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            ],
            28,
            margin=3,
            border_width=1,
            border_color="#ebddb2" # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=2,
    border_focus="#ebddb2",
    border_normal="#504945",
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None

wmname = "LG3D"
