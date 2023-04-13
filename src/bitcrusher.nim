import os

const FLAGS = ["-a", "-A", "-o", "-O", "-r", "-R", "-d", "-D", "-h", "-H"]

proc usage() = 
    stdout.write("-- Bitcrusher CPU Emulator --\n")
    stdout.write("USAGE: ./Program [flags..] <input>\n")
    stdout.write("    -a: assemble source file to bytecode\n")
    stdout.write("    -o: specify the outputfile\n")
    stdout.write("    -r: execute the given bytecode file (must assemble file first if not provided bytecode)\n")
    stdout.write("    -d: run in debug mode (used for testing)")
    stdout.write("    -h: print this help message\n")

proc assembleFile(infile: string, outfile: string) =
    echo "TODO: assembleFile"

proc executeFile(infile: string) = 
    echo "TODO: executeFile"

proc runDebug(infile: string, readfile: bool) =
    echo "TODO: runDebug"

proc processFlags(args: openArray[string]) =
    echo "todo processFlags"

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