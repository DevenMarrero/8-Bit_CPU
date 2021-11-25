import serial
import time

PORT = 'COM4'
arduino = serial.Serial(port=PORT, baudrate=115200, timeout=0.1)

# Allow connection to clear
time.sleep(2)

def write(byte):
	arduino.write(byte)
	data = None
	while data == None:
		time.sleep(0.05)
		data = arduino.readline()
	return data

def bytes_from_file(filename):
	with open(filename, "rb") as f:
		while True:
			chunk = f.read(1)
			if chunk:
				for byte in chunk:
					yield byte
			else:
				break

for byte in bytes_from_file("rom.bin"):
	# TODO send to arduino
	print(byte.to_bytes(1, byteorder="big"))
		


	