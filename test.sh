set -e
cd test
haxe compile.hxml --times
cd ..
bin/test/TestMain
