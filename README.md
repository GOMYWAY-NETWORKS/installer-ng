Scalr Next Generation Installer
===============================

An installer for [Scalr Open Source][0].

This installer supports Ubuntu 12.04, Red Hat Enterprise Linux 6, and CentOS 6.

If you run into any issues, or have suggestions, get in touch with us at
onboarding@scalr.com, or [file an issue][1].


Usage
=====

### Download ###

Log in to the server you'd like to install Scalr on, and run the following
command, preferably as root.

    curl -O https://raw.github.com/Scalr/installer-ng/master/scripts/install.py

### Install Scalr ###

Run the following, as root.

    python install.py

Note: we recommend that you run this command using GNU screen, so that the
installation process isn't interrupted if your SSH connection drops.


### Use Scalr ###

Visit your server on port 80 to get started. The output of the install script
contains your login credentials.

All generated credentials are logged to `/root/solo.json`, so you can
also retrieve them there.

Supported OSes
==============

  + Ubuntu 12.04
  + RHEL 6
  + CentOS 6


License
=======

Apache 2.0


  [0]: https://github.com/Scalr/scalr
  [1]: https://github.com/Scalr/installer-ng/issues
