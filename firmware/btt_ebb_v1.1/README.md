# EBB36/42

This configuration is for an EBB36/42 configured to communicate over CAN bus.
Because some of the steps aren't well-documented or use tools that aren't
available, I'm documenting it here for reproducibility.

| File          | Purpose                           |
|:--------------|:----------------------------------|
| Configuration | [`config`](./config)              |
| Firmware      | [`klipper.bin`](./klipper.bin)    |

## Documentation

- [Official GitHub repo](https://github.com/bigtreetech/EBB)
- [`dfu-util` information](https://dfu-util.sourceforge.net/)

## Configuration

| Config Option                 | Value                     |
|:------------------------------|:--------------------------|
| Micro-controller architecture | STMicroelectronics STM32  |
| Processor model               | STM32G0B1                 |
| Bootloader offset             | No bootloader             |
| Clock Reference               | 8 MHz crystal             |
| Communication interface       | CAN bus (on `PB0`/`PB1`)  |
| CAN bus speed                 | 500000                    |

## Building (Optional)

A prebuilt copy of the firmware using the given configuration file is provided
at [`klipper.bin`](./klipper.bin).

> Before starting these steps, make sure you've updated everything using
> [`../update.sh`](../update.sh).

The Klipper firmware build configuration ([`config`](./config) is automatically
linked into the copied Klipper source tree as `.config`. If necessary, you can
run `make menuconfig` to reconfigure, but generally you should only need to run
`make` to generate the firmware at `klipper/out/klipper.bin`.

## Flashing

The official documentation for flashing uses a closed-source tool that may or
may not actually be available. However, after some digging, it became apparent
than one could use `dfu-util` to accomplish the same thing.

> The following `dfu-util` commands may need to be run using `sudo` for them to
> work.

In order to get the board into DFU mode, you need to connect the `VUSB`
(bottom-right) jumper, connect the board via USB to your host machine, then
press and hold `BOOT` (left button) and briefly press `RST` (right button). You
can confirm the board is in DFU mode using:

```bash
dfu-util --list
```

Once you have verified the board is connected and in DFU mode, flash it using:

```bash
dfu-util -a 0 -D klipper.bin -s 0x08000000
```

This can also be done via `make flash`.

Afterwards, you are supposed to reset the board again using `RST`, but in
practice, I'm not sure this is strictly necessary. If you power-cycle the board,
it should act like it's booting up (e.g. BLTouch pin deploys and stows, etc.).

