import times, strutils, os
proc addPuff(filename: string) =
  let f = open(expandTilde(filename), fmAppend)
  defer: f.close()
  f.write("1|" & $getTime() & "\n")

proc countPuffs(filename: string): int =
  var puffs = 1
  let f = open(filename, fmRead)
  defer: f.close()
  for line in f.lines:
    puffs += 1
  result = puffs

proc main(add_puff=false, count=false, filename="/home/unseen/.puffs") =
  if add_puff:
    add_puff(filename)
  if count:
    stdout.writeLine(countPuffs(filename))
import cligen; dispatch(main)
