let doc = """
gitt - shorthand for git add . + commit + push

Usage:
  gitt -m <message>

Options:
 -h --help     Show this screen.
 --version     Show version.
"""


import docopt
from os import execShellCmd
from system import OSError

let args = docopt(doc, version = "gitt 0.1")

if args["-m"]:
  echo "Staging all files"
  discard execShellCmd("git add .")
  echo "Commiting files with message: " & $args["<message>"]
  var commit_string: string = "git commit -m \"" & $args["<message>"] & "\""
  discard execShellCmd(commit_string)
  echo "Pushing files"
  discard execShellCmd("git push")
# else:
#   raise newException(OSError, "")
