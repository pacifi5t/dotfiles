# Plasma setup with global menu

This setup won't work on some distros. It is guaranteed to work only on Arch Linux or openSUSE. The packages will be listed for Arch.

## Necessary packages

Dependencies:

```sh
yay -S libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 libdbusmenu-qt6 appmenu-gtk-module plasma-wayland-session
```

Patched apps:

```sh
yay -S firefox-appmenu thunderbird-appmenu
```

## Global menu

### .gtkrc-2.0

Add `gtk-modules=appmenu-gtk-module` to the end of the file to enable support for GTK2 apps.

## Consistent file dialog

Add `GTK_USE_PORTAL=1` to `/etc/environment`.

## Dock

Don't use the `latte-dock` package from repositories, it's outdated & works poorly in wayland. Install the `latte-dock-git` from AUR.

## Troubleshooting

### GTK app doesn't display the menu or `appmenu-gtk-module failed to load`

This happens for some GTK3 apps (Inkscape) running under Wayland. Force them to run with XWayland by using GDK_BACKEND=x11 environment variable.

Firefox patch doesn't work with Wayland, so leave it with X11.

### Menu lags when switching windows

Menu generally works better in Wayland session, so don't use X11.

### Global menu still doen't work

Adding this to the environment may help:

```sh
if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
    #GTK_MODULES="${GTK_MODULES}:unity-gtk-module"
else
    GTK_MODULES="appmenu-gtk-module"
    #GTK_MODULES="unity-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi
```
