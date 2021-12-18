import time
import argparse
import serial


def connect_arduino(port, baudrate):
	try:
		arduino = serial.Serial(port=port, baudrate=baudrate, timeout=0.1)
		time.sleep(2)
		return arduino
	except serial.serialutil.SerialException:
		print(f"ERROR: Could not find Arduino on {port}")
		exit()


def write_read(byte):
	arduino.write(bytes(byte, 'utf-8'))
	data = b''
	while data == b'':
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

if __name__ == "__main__":
    # command line argument parser
	parser = argparse.ArgumentParser(description="Send a bin file to an Arduino.")
	parser.add_argument("file", help="file to send to arduino")
	parser.add_argument("port", help="port to connect to arduino")
	parser.add_argument("-b", "--baudrate", type=int, default=115200,
						help="serial baudrate of arduino")

	args = parser.parse_args()
	file = args.file
	port = args.port
	baudrate = args.baudrate


	print("Initializing Connection...")
	arduino = connect_arduino(port, baudrate)
	print("Connection successful")

	print("Programming EEPROM")
	write_read('<')

	for byte in bytes_from_file(file):
		print("sent:", byte)
		response = write_read(str(byte) + ';')
		print("Recieved:", response.decode().replace("\n", ""))
	
	write_read('>')
	print("Finished Programming")
