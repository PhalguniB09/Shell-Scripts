#!/bin/bash
set -euo pipefail

echo "Testing undefined variable"
echo "hello $name"                             #name is undefined variable
echo "Testing failing command"
netstat                                        #This command will fail
echo "Testing failing in pipe"
false | true                                   #This would succeed without pipefail

