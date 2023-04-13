import os, strutils

import emulator/vm

const FLAGS = ["-a", "-A", "-o", "-O", "-r", "-R", "-d", "-D", "-h", "-H"]

type 
    ProgOpt = enum
        optNone, optDebug, optAssemble, optExecute

proc usage() = 
    stdout.write("-- Bitcrusher CPU Emulator --\n")
    stdout.write("USAGE: ./Program [flags..] <input>\n")
    stdout.write("    -a: assemble source file to bytecode\n")
    stdout.write("    -o: specify the outputfile\n")
    stdout.write("    -r: execute the given bytecode file (must assemble file first if not provided bytecode)\n")
    stdout.write("    -d: run in debug mode (used for testing)\n")
    stdout.write("    -h: print this help message\n")

proc assembleFile(infile: string, outfile: string) =
    echo "TODO: assembleFile"

proc executeFile(infile: string) = 
    echo "TODO: executeFile"

proc runDebug(infile: string, readfile: bool) =
    #var vm: VM
    #vm.init()

    #let x = vm.add(1, 2)
    echo "TODO: runDebug"


proc processFlags(args: openArray[string]) =
    var
        infile  = ""
        outfile = ""
        opt: ProgOpt
        currflag = ""

    for i, a in args:
        if a.startsWith('-'):
            if a in FLAGS:
                if a == "-h" or a == "-H":
                    usage()
                    break
                elif a == "-d" or a == "-D":
                    opt = optDebug
                    currflag = "-d" 
                else:
                    currflag = a
            else:
                echo "ERROR: Unknown flag: " & a & "\n    use `-h` for a list of supported flags"
                quit(1)
        else:
            if currflag != "":
                case currflag:
                    of "-a", "-A":
                        opt = optAssemble
                        infile = a
                        currflag = ""
                    of "-o", "-O":
                        outfile = a
                        currflag = ""
                    of "-r", "-R":
                        opt = optExecute
                        infile = a
                        currflag = ""
                    of "-d", "-D":
                        opt = optDebug
                        infile = a
                        currflag = ""
                    else:
                        echo "ERROR: Unrecognized flag: [" & currflag & "]"
                        break

    case opt:
        of optDebug:
            if infile == "":
                runDebug(infile, false)
            else:
                runDebug(infile, true)
        of optAssemble:
            assembleFile(infile, outfile)
        of optExecute:
            executeFile(infile)
        else:
            echo "infile: " & infile & " outfile: " & outfile & " option: " & $opt

proc main() =
    let args = commandLineParams()
    if len(args) > 0:
        processFlags(args)
    else:
        echo "Error: No input file provided."
        usage()
        quit(1)




when isMainModule:
    main()