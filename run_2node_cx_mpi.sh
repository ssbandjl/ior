: <<'COMMENT'
mpirun -np 4 192.168.100.167:2,192.168.100.119 /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile
COMMENT



# run_cmd "rm -rf /tmp/sxb/*"
# run_cmd "ls -alh /tmp/sxb/;du -sh /tmp/sxb"
log_file=log/cx/hpc_test_$(date +'%Y_%m_%d_%H_%M_%S')_log
echo $log_file
/root/project/hpc/mpi/daos/mpich-3.4.3/install/bin/mpirun -np 2 -f /root/project/hpc/ior/mpi_hostfile \
    -env LD_LIBRARY_PATH=/root/project/hpc/mpi/daos/mpich-3.4.3/install/lib \
    -env INCLUDE=/root/project/hpc/mpi/daos/mpich-3.4.3/install/include \
    /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -F -o /tmp/sxb/testfile > "$log_file" 2>&1
