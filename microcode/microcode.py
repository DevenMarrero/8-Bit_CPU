import yaml

def get_opcode(address, microcode, default=None):
    """Returns name of opcode when given binary address"""
    for opcode in microcode["instructions"]:
        if microcode["instructions"][opcode]["value"] == address:
            return opcode
    return default


def or_list(nums):
    """ Takes a list of integers and bitwise ORs them togethor"""
    number = 0
    for num in nums:
        number = number | num
    return number


# Load the microcode yaml
with open("microcode.yaml", 'rb') as file:
    microcode = yaml.safe_load(file)


print("Generating Microcode ROM...")
with open(microcode["output_file_name"], "wb") as out_file:
    for address in range(262144):
        #   SEL Flag   Inst   Step      
        # 0 0   0000 00000000 0000
        step = address & 0b000000000000001111
        instruction = (address & 0b000000111111110000) >> 4
        flags = (address & 0b001111000000000000) >> 12 # Overflow, negative, carry, zero
        byte_sel = (address & 0b100000000000000000) >> 17
        
        # print(f"\n{get_opcode(instruction, microcode)} Step: {step}")
        # print(bin(address), byte_sel, flags, instruction, step)

        micro = None
        defaultStep = {'lines': [0]}
        # First 3 steps are always PCO|MLI, PRO|MHI, MDO|II
        if step < 3:
            micro = microcode["instruction_prefix_steps"][step]
            
        else:
            # If the opcode exists
            if opcode := get_opcode(instruction, microcode):
                
                # If the step exists
                if micro := microcode["instructions"][opcode]["steps"].get(step):

                    # if it is a flag instruction
                    if microcode["instructions"][opcode].get("flag_inst"):

                        flagsDict = {
                            # 0000 = O N C Z
                            "zero": flags & 0b0001,
                            "carry": (flags & 0b0010) >> 1,
                            "negative": (flags & 0b0100) >> 2,
                            "overflow": (flags & 0b1000) >> 3,
                        }

                        # Each flag setting holds different instructions
                        for index, flag_setting in enumerate(micro):
                            fail = False

                            # Check if each flag in the flag setting is correct
                            for flag in micro[index]["flags"]:
                                
                                flagName = list(flag.keys())[0]
                                flagValue = list(flag.values())[0]

                                # fail if a flag does not match the computer status
                                if not flagsDict[flagName] == flagValue:
                                    fail = True
                                    break
                            
                            # if we go through all flags in a setting without failing, use that setting
                            if not fail:
                                micro = {"lines": micro[index]["lines"]}
                                break
                            
                            # If there was only one option and it failed assume default
                            if len(micro) == 1:
                                micro = {'lines': [0]}

                        
        if micro == None:
            micro = {'lines': [0]}

        # Convert lines to binary
        bytes = []
        for control_line in micro["lines"]:
            bytes.append(microcode["control_lines"][control_line])
            
        byte = or_list(bytes)

        if not byte_sel:
            out_file.write((byte & 0xFFFF).to_bytes(2, byteorder='big'))
        else:
            out_file.write((byte >> 16).to_bytes(2, byteorder='big'))

        #if address % 512 == 0:
        #    print(".", end="")
print("Done: " + microcode["output_file_name"])
