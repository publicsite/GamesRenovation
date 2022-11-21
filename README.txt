I found a list on wikipedia of commercial games that were released as open source (inc. data)

I decided to try and compile many of these ... primarily the ones that were written in C/C++

I had varying success ... you can read the status.txt file in each subdirectory as to the status of each game


The flow is like this:

cd <thisdir>
./getdeps_all.sh
./getdoc_all.sh
./get_all.sh
./build_all.sh

It's important to call the scripts from the top of the tree


You can also cd into a subdir and run 

./getdeps.sh
./getdoc.sh
./get.sh
./build.sh

if you are only interested in (a) certain game(s).


====To Donate====

https://www.paypal.com/donate/?hosted_button_id=SZABYRV48SAXW