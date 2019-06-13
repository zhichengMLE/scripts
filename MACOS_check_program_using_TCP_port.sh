#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title:
#          Description:
# ------------------------------------------------------------------

VERSION=0.1.0

programname=$0

function Usage {
  echo "usage: $programname [-p Port Number] "
  echo "  -p      specify port number"
  echo "  -h      display help"
}


# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    Usage
    exit 1;
fi

while getopts ":vhp:" optname
  do
    case "$optname" in
      "v")
        echo "Version ${VERSION}"
        exit 0;
        ;;
      "h")
        Usage
        exit 1;
        ;;
      "p")
        portNum=${OPTARG}
        ;;
      "?")
        echo "Unknown option ${OPTARG}"
        exit 0;
        ;;
      ":")
        echo "No argument value for option ${OPTARG}"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

# -----------------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
# -----------------------------------------------------------------

echo "Query Port: ${portNum}"
echo "----------------------------------"
lsof -nP -i4TCP:${portNum} | grep LISTEN
echo "----------------------------------"
