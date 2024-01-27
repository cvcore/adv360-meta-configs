# adv360-meta-configs

Repository containing the keymaps and other modifications to adv360 keyboard.

## Setup

The individual command could change due to upstream toolchain update. Refer to
official docs for the latest command.

```bash
git clone https://github.com/cvcore/adv360-meta-configs.git
git submodule update --init --recursive
```

Then, open this repository in VSCode devcontainer. Inside the container, do:

```bash
cd $WORKSPACE_DIR/zmk
west init
west update
../scripts/build_in_docker.sh
```

Afterwards, find the firmwares in `$WORKSPACE_DIR/firmware`. Flash them with:

```bash
cd firmware
rsync (ls -t *-left.uf2 | head -n 1 | tee) /Volumes/ADV360PRO/  # for left split
rsync (ls -t *-left.uf2 | head -n 1 | tee) /Volumes/ADV360PRO/  # for right split
```

## Directory Structure

- `adv360-pro-zmk`: folder containing the configurations. These include keymaps, switches to certain behaviors and etc and controls the compilation of `zmk`.
- `zmk`: folder containing the `zmk` firmware source code. `zmk` is an application layer built on top of the Zephyr RTOS specifically for customized keyboards. It uses the `west` command to manage the builds and dependencies.

## Why Doing this at all?

Adv360 is a great key board, until you try to customize it and to reflash the firmware. From my past experiences, upstream changes to the zmk firmware can cause undesired behavior of the keyboard, and some of those are hard to be reproduced.

Due to this reason, I decided to open this repository to track my own configuration together with their associated zmk version. And they are maintained with git submodules. The goal is, given specific versions of zmk, adv360-pro-zmk and Zephyr version (linked by zmk), the compiled firmware should have identical functionality, which helps to track down potential issues introduced by upstream changes.

## Disclaimer

Since there could be minor differences between hardwares, I cannot guarantee that this will work for every Adv360. Use this repo at your own risk.
