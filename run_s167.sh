mpirun -hostfile /path/to/hostfile_clients -np 10 /root/project/hpc/ior/install/bin/ior -a POSIX -b 5G -t 1M -v -W -w -r -R -i 1 -o /tmp/daos_dfuse/testfile
mpirun -hostfile /path/to/hostfile_clients -np 10 <your_dir>/bin/mdtest -a POSIX -z 0 -F -C -i 1 -n 3334 -e 4096 -d /tmp/daos_dfuse/ -w 4096




dmg pool create sxb -z 4g; dmg pool list --verbose
daos container create sxb --type POSIX sxb; daos container query sxb sxb --verbose; daos cont get-prop sxb sxb
mkdir -p /tmp/sxb; dfuse --mountpoint=/tmp/sxb --pool=sxb --cont=sxb; df -h

mpirun -np 10 /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile



mpirun -np 10 /root/project/hpc/ior/install/bin/mdtest -a POSIX -z 0 -F -C -i 1 -n 3334 -e 4096 -d /tmp/sxb/ -w 4096


test_log:
dmg sys query -v
root@hpc167:~/project/hpc/ior/build# mkdir -p /tmp/sxb; dfuse --mountpoint=/tmp/sxb --pool=sxb --cont=sxb; df -h
Filesystem      Size  Used Avail Use% Mounted on
udev             32G     0   32G   0% /dev
tmpfs           6.3G  2.3M  6.3G   1% /run
/dev/nvme0n1p2  234G   66G  156G  30% /
tmpfs            32G     0   32G   0% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs            32G     0   32G   0% /sys/fs/cgroup
/dev/loop0       56M   56M     0 100% /snap/core18/2887
/dev/loop1       56M   56M     0 100% /snap/core18/2846
/dev/loop2       50M   50M     0 100% /snap/snap-store/467
/dev/loop3       74M   74M     0 100% /snap/core22/1748
/dev/loop5      219M  219M     0 100% /snap/gnome-3-34-1804/93
/dev/loop4       92M   92M     0 100% /snap/gtk-common-themes/1535
/dev/loop6       45M   45M     0 100% /snap/snapd/23545
/dev/loop7       74M   74M     0 100% /snap/core22/2010
/dev/loop12     128K  128K     0 100% /snap/bare/5
/dev/loop9       51M   51M     0 100% /snap/snapd/24718
/dev/loop8       63M   63M     0 100% /snap/gtk-common-themes/1506
/dev/loop11      13M   13M     0 100% /snap/snap-store/1216
/dev/loop13     256M  256M     0 100% /snap/gnome-3-34-1804/36
/dev/loop10     517M  517M     0 100% /snap/gnome-42-2204/202
/dev/nvme0n1p1  511M  6.1M  505M   2% /boot/efi
tmpfs           6.3G     0  6.3G   0% /run/user/0
dfuse           3.8G  2.2G  1.7G  57% /tmp/sxb
root@hpc167:~/project/hpc/ior/build# mpirun -np 10 /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile
IOR-4.1.0+dev: MPI Coordinated Test of Parallel I/O
Began               : Fri Jul 18 16:11:05 2025
Command line        : /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile
Machine             : Linux hpc167
TestID              : 0
StartTime           : Fri Jul 18 16:11:05 2025
Path                : /tmp/sxb/testfile
FS                  : 3.7 GiB   Used FS: 56.9%   Inodes: -0.0 Mi   Used Inodes: 0.0%

Options: 
api                 : POSIX
apiVersion          : 
test filename       : /tmp/sxb/testfile
access              : single-shared-file
type                : independent
segments            : 1
ordering in a file  : sequential
ordering inter file : no tasks offsets
nodes               : 1
tasks               : 10
clients per node    : 10
memoryBuffer        : CPU
dataAccess          : CPU
GPUDirect           : 0
repetitions         : 1
xfersize            : 1 MiB
blocksize           : 10 MiB
aggregate filesize  : 100 MiB
verbose             : 1

Results: 

access    bw(MiB/s)  IOPS       Latency(s)  block(KiB) xfer(KiB)  open(s)    wr/rd(s)   close(s)   total(s)   iter
------    ---------  ----       ----------  ---------- ---------  --------   --------   --------   --------   ----
write     284.17     284.84     0.035106    10240      1024.00    0.001105   0.351069   0.000144   0.351902   0   
Verifying contents of the file(s) just written.
Fri Jul 18 16:11:05 2025

read      11530      11963      0.000827    10240      1024.00    0.000195   0.008359   0.000210   0.008673   0   
remove    -          -          -           -          -          -          -          -          0.001194   0   
Max Write: 284.17 MiB/sec (297.97 MB/sec)
Max Read:  11530.10 MiB/sec (12090.18 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev   Max(OPs)   Min(OPs)  Mean(OPs)     StdDev    Mean(s) Stonewall(s) Stonewall(MiB) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt   blksiz    xsize aggs(MiB)   API RefNum
write         284.17     284.17     284.17       0.00     284.17     284.17     284.17       0.00    0.35190         NA            NA     0     10  10    1   0     0        1         0    0      1 10485760  1048576     100.0 POSIX      0
read        11530.10   11530.10   11530.10       0.00   11530.10   11530.10   11530.10       0.00    0.00867         NA            NA     0     10  10    1   0     0        1         0    0      1 10485760  1048576     100.0 POSIX      0
Finished            : Fri Jul 18 16:11:05 2025
root@hpc167:~/project/hpc/ior/build# mpirun -np 10 /root/project/hpc/ior/install/bin/mdtest -a POSIX -z 0 -F -C -i 1 -n 3334 -e 4096 -d /tmp/sxb/ -w 4096
-- started at 07/18/2025 16:11:20 --

mdtest-4.1.0+dev was launched with 10 total task(s) on 1 node(s)
Command line used: /root/project/hpc/ior/install/bin/mdtest '-a' 'POSIX' '-z' '0' '-F' '-C' '-i' '1' '-n' '3334' '-e' '4096' '-d' '/tmp/sxb/' '-w' '4096'
Nodemap: 1111111111
Path                : /tmp/sxb/
FS                  : 3.7 GiB   Used FS: 59.5%   Inodes: -0.0 Mi   Used Inodes: 0.0%
10 tasks, 33340 files

SUMMARY rate (in ops/sec): (of 1 iterations)
   Operation                     Max            Min           Mean        Std Dev
   ---------                     ---            ---           ----        -------
   File creation                1200.016       1200.016       1200.016          0.000
   File stat                       0.000          0.000          0.000          0.000
   File read                       0.000          0.000          0.000          0.000
   File removal                    0.000          0.000          0.000          0.000
   Tree creation                1808.669       1808.669       1808.669          0.000
   Tree removal                    0.000          0.000          0.000          0.000
-- finished at 07/18/2025 16:11:49 --

root@hpc167:~/project/hpc/ior/build# 





