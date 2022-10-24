# EBB36

## Building

> Before starting, make sure you've updated everything using
> [`../update.sh`](../update.sh).

## Flashing

```
sudo dfu-util -a 0 -D out/klipper.bin -s 0x08000000
```

