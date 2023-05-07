# SKR Mini E3 v3.0

This configuration is for a SKR Mini E3 v3.0 configured to communicate over CAN
bus on the USB port (`PA11`/`PA12`), in order to work with the USB ports on the
U2C. This is used both with the Ender 3 Pro and Ender 6 setups.

| File          | Purpose                           |
|:--------------|:----------------------------------|
| Configuration | [`config`](./config)              |
| Firmware      | [`klipper.bin`](./klipper.bin)    |

## Documentation

- [Official GitHub repo](https://github.com/bigtreetech/BIGTREETECH-SKR-mini-E3)

## Configuration

| Config Option                 | Value                         |
|:------------------------------|:------------------------------|
| Micro-controller architecture | STMicroelectronics STM32      |
| Processor model               | STM32G0B1                     |
| Bootloader offset             | 8KiB bootloader               |
| Clock Reference               | 8 MHz crystal                 |
| Communication interface       | CAN bus (on `PA11`/`PA12`)    |
| CAN bus speed                 | 500000                        |

## Building (Optional)

A prebuilt copy of the firmware using the given configuration file is provided
at [`klipper.bin`](./klipper.bin).

The Klipper firmware build configuration ([`config`](./config) is automatically
linked into the copied Klipper source tree as `.config`. If necessary, you can
run `make menuconfig` to reconfigure, but generally you should only need to run
`make` to generate the firmware at `klipper/out/klipper.bin`.

## Flashing

The resulting firmware binary should be copied to a TF card as `firmware.bin`.

