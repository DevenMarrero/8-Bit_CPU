import yaml

def get_opcode(address, microcode):
    for opcode in microcode["instructions"]:
        if microcode["instructions"][opcode]["value"] == address:
            return opcode
    return None


def or_list(nums):
    number = 0
    for num in nums:
        number = number | num
    return number


with open("microcode.yaml", 'rb') as file:
    microcode = yaml.safe_load(file)

control_lines = microcode["control_lines"]

print("Generating Microcode ROM")

with open(microcode["output_file_name"], "wb") as out_file:
    # 262143
    for address in range(262143):
        #   SEL Flag   Inst   Step      
        # 0 0   0000 00000000 0000
        step = address & 0b000000000000001111
        instruction = (address & 0b000000111111110000) >> 4
        flag = (address & 0b001111000000000000) >> 12
        byte_sel = (address & 0b100000000000000000) >> 17
        
        #print(f"\n{get_opcode(instruction, microcode)} Step: {step}")
        #print(bin(address), byte_sel, flag, instruction, step)

        micro = None
        # First 3 steps are always PCO|MLI, PRO|MHI, MDO|II
        if step < 3:
            micro = microcode["instruction_prefix_steps"][step]
        else:
            # If the opcode exists
            if opcode := get_opcode(instruction, microcode):
                
                # If the step exists
                micro = microcode["instructions"][opcode]["steps"].get(step)

            # Otherwise just zero fill
            if micro is None:
                micro = [{'lines': [0]}]

        bytes = []
        for control_line in micro[0]["lines"]:
            bytes.append(control_lines[control_line])
            
        byte = or_list(bytes)

        #print("Micro:", micro, "Bits:", byte)
        if not byte_sel:
            out_file.write((byte & 0xFFFF).to_bytes(2, byteorder='big'))
        else:
            out_file.write((byte >> 16).to_bytes(2, byteorder='big'))

        if address % 256 == 0:
            print(".", end="")
print(" done")
