tptp4X=./tptp4X
call=./RemoteSOT.pl
# if the above programs don't work for you download the SystemOnTPTP package,
# install it and change the above paths accordingly

proverlist='LEO-II---1.6.0 Satallax---2.7 Isabelle---2013 Nitrox---2013 agsyHOL---1.0 TPS---3.120601S1b'
timeout=60

echo
echo Asking various HOL-ATPs in Miami remotely \(thanks to Geoff Sutcliffe\)

for file in "$@"
do
echo
    for prover in $proverlist 
    do
    function_to_fork () { 
        echo $file ++++++ `$tptp4X -t $timeout -x $file | $call -t $timeout -s $prover | grep RESULT` 
    }
    function_to_fork &
    done
    echo 
done





