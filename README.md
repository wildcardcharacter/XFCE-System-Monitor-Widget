# XFCE-System-Monitor-Widget
A lightweight system monitor widget for XFCE using the Genmon Plugin.

## Features

* Real-time CPU usage
* Current RAM usage
* CPU temperature monitoring
* Color-coded temperature indicator
* Lightweight Bash implementation
* Designed for XFCE and Genmon
* No additional graphical applications required

## Screenshot

![XFCE System Monitor Widget](images/system-monitor-widget.png)

Example:

```text
28°C | 5% | 2.8Gi
```

## Requirements

* Debian 13 (or compatible Linux distribution)
* XFCE Desktop Environment
* xfce4-genmon-plugin
* lm-sensors

Install required packages:

```bash
sudo apt install lm-sensors
```

Detect available sensors:

```bash
sudo sensors-detect
```

## Installation

Copy the script to:

```bash
~/.local/bin/system-monitor.sh
```

Make it executable:

```bash
chmod +x ~/.local/bin/system-monitor.sh
```

## XFCE Genmon Configuration

Command:

```text
/home/USERNAME/.local/bin/system-monitor.sh
```

Recommended refresh interval:

```text
30
```

Enable:

```text
Use markup
```

## Display

Panel:

```text
28°C | 5% | 2.8Gi
```

Tooltip:

```text
System-Monitor

Temperatur: 28°C
CPU: 5%
RAM: 2.8Gi
```

### Temperature Colors

| Temperature | Color  |
| ----------- | ------ |
| < 50°C      | Green  |
| 50–69°C     | Orange |
| ≥ 70°C      | Red    |

## Why?

This widget was created to provide a simple and lightweight system monitor for XFCE without requiring large desktop widgets or additional monitoring software.

It integrates seamlessly into the XFCE panel and offers quick access to the most important system information.

## Technologies

* Bash
* XFCE Genmon
* lm-sensors

## License

MIT License

