
import stack

type
    VM* = object
        stack*: Stack

proc init*(vm: var VM) =
    vm.stack.init()

proc add*(vm: var VM, a, b: uint8): uint8 =
    echo "push " & $a
    vm.stack.push(a)
    echo "push " & $b
    vm.stack.push(b)

    let sum = (vm.stack.pop() + vm.stack.pop())

    vm.stack.push(sum)
    return vm.stack.peek()