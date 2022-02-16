#!/usr/bin/env python3
#!/usr/bin/env bash

echo -e "\n++++++++++++++++++\n+++++ UPTIME +++++\n++++++++++++++++++"; 
uptime ;
echo -e ;for i in $(nproc);do echo -e "\n+++++++++++++++++\n+++++ VCPU ++++++\n+++++++++++++++++\nQuantidade de vcpu: $i";
done ;
echo -e "\n+++++++++++++++++++\n+ ESPAÇO EM DISCO +\n+++++++++++++++++++"; 
echo "Filesystem      Size  Used Avail Use% Mounted on" && df -h | grep -E  "/dev/sd" ;
for a in $(python3 -c "import os;print(int(round(os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES') / 1024.0**3)))");
do echo -e "\n++++++++++++++++++\n+++++ MEMORIA ++++\n++++++++++++++++++\nQuantidade de memoria: $a Gb\n";
done
