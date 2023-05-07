# CAN Bus

Klipper supports MCUs attached via CAN bus. Additionally, many of the BTT boards
support a CAN bus interface of some sort, either over a dedicated connection, or
over the USB port.

## Linux CAN Bus

In order to use CAN bus, you must configure the adapter's CAN network interface
to be automatically set up by the network subsystem. For a standard Raspberry Pi
Debian-based OS, you can add a configuration file to do this:

`/etc/network/interfaces.d/can0`        
```text
auto can0
  iface can0 inet manual
  pre-up /sbin/ip link set can0 type can bitrate 500000
  up /sbin/ip link set can0 up
  down /sbin/ip link set can0 down
```

> **NOTE:** depending on which CAN adapter you are using, you may need to do
> additional configuration steps (overlays, etc.) for the interface to show up.

## Endpoint Discovery

In order to use MCUs attached via CAN bus, you need to dicsover the endpoint
UUIDs for your `printer.cfg` file. Klipper provides a script to do this:

```bash
~ $ ./klippy-env/bin/python ./klipper/scripts/canbus_query.py can0
Found canbus_uuid=<UUID>, Application: Klipper
Total 1 uuids found
```

The associated Klipper configuration block for the MCU will look something like
the following:

```conf
[mcu]
canbus_uuid: <UUID>
canbus_interface: can0
```

See the sample configuration files contained within this repo for additional
examples of how this can be used.

## Adapters

### BTT UC2 v2.1

The UC2 is fairly straightforward to use. Generally, you'll need to add jumpers
to the primary `120R` header and whichever USB port's `120R` and `VBUS` headers
(if you're using the USB port). Wire the 12/24V printer power (probably via a
separate pair of terminals on the PSU) to the screw-terminal blocks on the end,
and connect the relevant other `CAN_OUT` interface on the righthand side.

### MakerBase UTC v1.0

> _FIXME_

## Control Boards

### BTT EBB36 v1.1

While you can connect this board via USB-C, CAN bus is the easiest, since it
brings 24V power along via the MOLEX connector on the board. **IMPORTANT:** the
pins, clockwise from upper left are, in order: `L`, `H`, `V+`, `V-`. This is not
well documented.

### BTT EBB42 v1.1

> _FIXME_

### BTT SKR Mini E3 v3.0

Thee easiest way to connect this board is via USB serial; however, you can also
configure Klipper to communicate using CAN bus over the USB port
(`PA11`/`PA12`), which generally requires using a BTT UC2 adapter.

### MakerBase THR36

> _FIXME_

### MakerBase THR42

> _FIXME_

