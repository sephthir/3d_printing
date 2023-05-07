# BTT Octopus v1.1

This configuration is for a standalone BTT Octopus v1.1, configured to talk over
USB/UART to a directly attached Klipper instance. Overall, it is a standard
configuration for Klipper, nothing fancy, but stored here for convenience.

## Printers

    - [TronXY X5SA-400 Pro conversion](../../tronxy_x5sa-400_pro)

## Files

| File          | Purpose                           |
|:--------------|:----------------------------------|
| Configuration | [`config`](./config)              |
| Firmware      | [`klipper.bin`](./klipper.bin)    |

## Documentation

- [Official GitHub repo](https://github.com/bigtreetech/BIGTREETECH-OCTOPUS-V1.0)

## Configuration

| Config Option                 | Value                     |
|:------------------------------|:--------------------------|
| Micro-controller architecture | STMicroelectronics STM32  |
| Processor model               | STM32F446                 |
| Bootloader offset             | 32KiB bootloader          |
| Clock Reference               | 12 MHz crystal            |
| Communication interface       | USB (on `PA11`/`PA12`)    |

## Building (Optional)

A prebuilt copy of the firmware using the given configuration file is provided
at [`klipper.bin`](./klipper.bin).

The Klipper firmware build configuration ([`config`](./config) is automatically
linked into the copied Klipper source tree as `.config`. If necessary, you can
run `make menuconfig` to reconfigure, but generally you should only need to run
`make` to generate the firmware at `klipper/out/klipper.bin`.

