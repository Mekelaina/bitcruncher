
import stack

type
    VM* = object
        stack*: Stack

proc init*(vm: var VM) =
    vm.stack.init()

proc add*(vm: var VM, a, b: uint8): uint8 =
    vm.stack.push(a)
    vm.stack.push(b)

    let 
        y = vm.stack.pop()
        x = vm.stack.pop()
    
    vm.stack.push(x + y)

    return vm.stack.peek()