# Onboard Arduino Programmer
This folder contains the Arduino sketch and Python script for uploading programs to the CPU.
The sketch is uploaded to an Arduino nano which sits on standby until it recieves a USB signal.

## Usage
`pip install pyserial` for serial communication.

`python sendFile.py [-h] [-b BAUDRATE] file port`

positional arguments:
  - file       binary file to send to arduino
  - port      port to connect to arduino (ie. COM4)

optional arguments:
  - -h, --help
  - -b, --baudrate      serial baudrate of Arduino, default=115200
