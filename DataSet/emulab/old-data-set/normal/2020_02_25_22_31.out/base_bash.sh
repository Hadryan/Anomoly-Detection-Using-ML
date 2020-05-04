#!/bin/bash
function run_tstat()
{
        tstat -l -i enp9s4f1 -s  $1 &
        TSTAT_PID=$!
        echo "TSTAT Started, PID = $TSTAT_PID"
        sleep 1
        for i in {1..3}
                do
                                        echo "Starting iPerf Test #$i.$j"
                                        iperf3 -c 10.10.1.2 -t 12
                                        echo "iPerf Complete"
                done
        kill -s INT $TSTAT_PID
}

sudo -H -u pooya bash -c 'ssh -p 22 pooya@pc484.emulab.net "sudo ipfw pipe 100 config bw 20Mbits/s'
run_tstat  OUT_DATA/new/new/normal2
tc qdisc add dev enp9s4f0 root netem loss 0.01%
run_tstat  OUT_DATA/new/loss_0.01
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem loss 0.05%
run_tstat  OUT_DATA/new/loss_0.05
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem loss 0.1%
run_tstat  OUT_DATA/new/loss_0.1
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem loss 0.5%
run_tstat  OUT_DATA/new/loss_0.5
tc qdisc del dev enp9s4f0 root netem

tc qdisc add dev enp9s4f0 root netem duplicate 0.01%
run_tstat  OUT_DATA/new/duplicate_0.01
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem duplicate 0.05%
run_tstat  OUT_DATA/new/duplicate_0.05
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem duplicate 0.1%
run_tstat  OUT_DATA/new/duplicate_0.1
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem duplicate 0.5%
run_tstat  OUT_DATA/new/duplicate_0.5
tc qdisc del dev enp9s4f0 root netem

tc qdisc add dev enp9s4f0 root netem corrupt 0.01%
run_tstat  OUT_DATA/new/corrupt_0.01
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem corrupt 0.05%
run_tstat  OUT_DATA/new/corrupt_0.05
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem corrupt 0.1%
run_tstat  OUT_DATA/new/corrupt_0.1
tc qdisc del dev enp9s4f0 root netem
tc qdisc add dev enp9s4f0 root netem corrupt 0.5%
run_tstat  OUT_DATA/new/corrupt_0.5
tc qdisc del dev enp9s4f0 root netem