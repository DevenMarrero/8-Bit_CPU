# Microcode
This folder contains the necessary tools to define the CPU's opcodes and compile them into a binary file. All of the opcodes and their steps are listed in microcode.yaml.

## Opcodes
The first thing in the YAML file is a list of values for all the control wires on the EPROMS. Under the instructions list are where all the opcodes are stored such as this one.

```
  MOV_A_B:
    value: 1
    steps:
      3:
        lines:
          - BO
          - AI
      4:
        lines:
          - SCR
```

The fist item under each instruction is its binary opcode. Then a list of steps and what lines should be high during that step. These lines reference the control wires defined at the top. 

There is a maximum of 15 steps and the list starts at 3 because steps 0-2 are defined in the instruction_prefix_steps and are the same for every intruction.

### Conditional Instructions
Adding conditional instructions are not much harder and follow the format like the one below.

```
  RETZ:
    value: 0x70
    flag_inst: True
    steps:
      3:
        - flags:
            - zero:  0
          lines:
            - SCR

        - flags:
            - zero: 1
          lines:
            - SLO
            - MLI
      4:
        - flags:
            - zero: 1
          lines:
            - SHO
            - MHI
      5:
        - flags:
            - zero: 1
          lines:
            - MDO
            - PCI
            - SPE # Stack count default to up
      6:
        - flags:
            - zero: 1
          lines:
            - SLO
            - MLI
      7:
        - flags:
            - zero: 1
          lines:
            - MDO
            - PRI
            - SPE
      8:
        - flags:
            - zero: 1
          lines:
            - SCR
```

We can see there is an additional key-value of flag_inst: True at the top. Each step is also now split into separate lists for each permutation of applicable flags. If the inverse of a flag is not listed (such as zero: 0 only being listed in step 3) it is just assumed to be blank.
