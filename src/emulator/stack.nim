
const STACK_MAX*: uint = 256

type
    Stack* = object
        sptr: int
        stack: array

proc init*(stack: var Stack) = 
    stack.sptr = 0
    stack.stack = array[STACK_MAX, uint8]

proc push*(stack: var Stack, value: uint8) = 
    stack.stack[stack.sptr] = value
    inc stack.sptr

proc pop*(stack: var Stack): uint8 = 
    result = stack.stack[stack.sptr]
    dec stack.sptr

proc peek*(stack: Stack): uint8 = 
    return = stack.stack[stack.sptr]

proc peek*(stack: Stack, distance: uint8): uint8 =
    return stack.stack[stack.sptr - distance]