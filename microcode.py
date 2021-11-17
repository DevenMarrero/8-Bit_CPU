import yaml

def address_in_microcode(address, microcode):
    for opcode in microcode["instructions"]:
        if microcode["instruction"][opcode]["value"] == address:
            return True
    return False


with open("microcode.yaml", 'rb') as file:
    microcode = yaml.safe_load(file)

control_lines = microcode["control_lines"]
# 262143
for address in range(255):
    #   SEL Flag   Inst   Step      
    # 0 0   0000 00000000 0000
    step = address & 0b000000000000001111
    instruction = (address & 0b000000111111110000) >> 4
    flag = (address & 0b001111000000000000) >> 12
    bitSel = (address & 0b010000000000000000) >> 16
    print(bin(address), bitSel, flag, instruction, step)

    if step < 3:
        micro = (microcode["instruction_prefix_steps"][str(step)])
    break

    if address_in_microcode(address, microcode):
        pass
    else:
        pass

    # with open(microcode["output_file_name"], "wb") as out_file:
    #     out_file.write()


