
const STACK_MAX*: uint = 256

type
    Stack* = object
        sptr: int
        mem: array[STACK_MAX, uint8]

proc init*(stack: var Stack) = 
    stack.sptr = 0

proc push*(stack: var Stack, value: uint8) = 
    stack.mem[stack.sptr] = value
    stack.sptr += 1

proc pop*(stack: var Stack): uint8 = 
    stack.sptr -= 1
    let r = stack.mem[stack.sptr]
    return r

proc peek*(stack: Stack): uint8 = 
    return stack.mem[stack.sptr]

proc peek*(stack: Stack, distance: uint8): uint8 =
    return stack.mem[ uint8(stack.sptr) - distance]

proc dump*(stack: Stack): array[STACK_MAX, uint8] =
    return stack.mem