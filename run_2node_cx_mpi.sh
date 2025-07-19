: <<'COMMENT'
mpirun -np 4 192.168.100.167:2,192.168.100.119 /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile
COMMENT



# run_cmd "mkdir -p /tmp/sxb; /root/project/stor/daos/install/bin/dfuse --mountpoint=/tmp/sxb --pool=sxb --cont=sxb; df -h"
# run_cmd "rm -rf /tmp/sxb/*"
# run_cmd "ls -alh /tmp/sxb/;du -sh /tmp/sxb;df -h"
# run_cmd "umount /tmp/sxb/"

# ior
# log_file=log/cx/hpc_ior_test_$(date +'%Y_%m_%d_%H_%M_%S')_log
# echo $log_file
# /root/project/hpc/mpi/daos/mpich-3.4.3/install/bin/mpirun -np 2 -f /root/project/hpc/ior/mpi_hostfile \
#     -env LD_LIBRARY_PATH=/root/project/hpc/mpi/daos/mpich-3.4.3/install/lib \
#     -env INCLUDE=/root/project/hpc/mpi/daos/mpich-3.4.3/install/include \
#     /root/project/hpc/ior/install/bin/ior -a POSIX -b 2G -t 128M -v -W -w -r -R -i 2 -F -vvv -o /tmp/sxb/testfile > "$log_file" 2>&1

# mdtest file create/stat/remove/read
# log_file=log/cx/hpc_mdtest_$(date +'%Y_%m_%d_%H_%M_%S')_log
# echo $log_file
# /root/project/hpc/mpi/daos/mpich-3.4.3/install/bin/mpirun -np 2 -f /root/project/hpc/ior/mpi_hostfile \
#     -env LD_LIBRARY_PATH=/root/project/hpc/mpi/daos/mpich-3.4.3/install/lib \
#     -env INCLUDE=/root/project/hpc/mpi/daos/mpich-3.4.3/install/include \
#     /root/project/hpc/ior/install/bin/mdtest -a POSIX -z 3 -F -C -T -E -r -i 2 -y -n 3334 -e 4096 -w 4096 -d /tmp/sxb/ -vvv > "$log_file" 2>&1


# mdtest file create/stat/remove/read, sync, 8k, 10000 files
log_file=log/cx/hpc_mdtest_$(date +'%Y_%m_%d_%H_%M_%S')_log
echo $log_file
/root/project/hpc/mpi/daos/mpich-3.4.3/install/bin/mpirun -np 2 -f /root/project/hpc/ior/mpi_hostfile \
    -env LD_LIBRARY_PATH=/root/project/hpc/mpi/daos/mpich-3.4.3/install/lib \
    -env INCLUDE=/root/project/hpc/mpi/daos/mpich-3.4.3/install/include \
    /root/project/hpc/ior/install/bin/mdtest -a POSIX -z 3 -F -C -T -E -r -i 5 -y -n 10000 -e 8192 -w 8192 -d /tmp/sxb/ -vvv > "$log_file" 2>&1
