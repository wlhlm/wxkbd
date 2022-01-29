wxkbd - X key repeat settings daemon
====================================

This daemon applies key repeat rate and delay settings to keyboards connected to
an X server.

This was born out of the lack of proper tools for setting key repeat rate and
delay under modern X with XInput2 outside of Desktop Environments. Currently
there are two options of configuring key repeat:

- Using the X command line parameters `-ardelay` and `-arinterval`
- Using `xset r rate`

The problem with the former is that it requires changing the X server command
line which might not be supported by the display manager. The good thing is,
that it applies the settings to newly plugged in keyboards as well, which the
latter option does not. `xset` would have to be rerun each time a new keyboard
is connected. X input developer Peter Hutterer describes the problem of the
inadequacy of tools like `xset` or `setxkbmap` for modern X input in the
[linked blog post][HuttererDeconfiguration]. In [this bug
report][HuttererSuggestion] he suggests relying on the desktop environment for
configuring X input devices or writing/using a daemon that applies the
configuration continually when working outside of a DE. This is were `wxkbd`
comes in. It listens for X input events and can:

- Set key repeat rate and delay when a new keyboard is plugged in

After writing this program, I discovered similar daemons that you should check
out too:

- [xplugd](https://github.com/troglobit/xplugd)
- [xinputd](https://github.com/bbenne10/xinputd)

These are interesting, because they let you run arbitrary commands for X input
events allowing for example to set keyboard layouts using `setxkbmap`, which
`wxkbd` does not support.

[HuttererDeconfiguration]: https://who-t.blogspot.com/2010/06/keyboard-configuration-its-complicated.html
[HuttererSuggestion]: https://bugzilla.redhat.com/show_bug.cgi?id=601853#c16

Usage
-----

    $ wxkbd -h
    Usage: wxkbd [-r rate] [-d delay]

Dependencies
------------

- libxcb

Build process
-------------

Just run `make`, which should produce a single executable `wxkbd`.

License
-------

This software is under the terms of the MIT software license. More information
can be found in the `LICENSE` file.
