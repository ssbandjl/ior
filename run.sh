mpirun -hostfile /path/to/hostfile_clients -np 10 /root/project/hpc/ior/install/bin/ior -a POSIX -b 5G -t 1M -v -W -w -r -R -i 1 -o /tmp/daos_dfuse/testfile
mpirun -hostfile /path/to/hostfile_clients -np 10 <your_dir>/bin/mdtest -a POSIX -z 0 -F -C -i 1 -n 3334 -e 4096 -d /tmp/daos_dfuse/ -w 4096




dmg pool create sxb -z 4g; dmg pool list --verbose
daos container create sxb --type POSIX sxb; daos container query sxb sxb --verbose; daos cont get-prop sxb sxb
mkdir -p /tmp/sxb; dfuse --mountpoint=/tmp/sxb --pool=sxb --cont=sxb; df -h

mpirun -np 10 /root/project/hpc/ior/install/bin/ior -a POSIX -b 10M -t 1M -v -W -w -r -R -i 1 -o /tmp/sxb/testfile



mpirun -np 10 /root/project/hpc/ior/install/bin/mdtest -a POSIX -z 0 -F -C -i 1 -n 3334 -e 4096 -d /tmp/sxb/ -w 4096





