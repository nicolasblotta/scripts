#!/usr/bin/env python3
#!/usr/bin/env bash
IP=`hostname -I | cut -d ' ' -f 1`
UPTIME=`uptime|awk -F, '{print $1}'`
VCPU=`nproc`
ESPACO=`echo "Filesystem      Size  Used Avail Use% Mounted on" && df -h | grep -E  "/dev/sd"`
MEM=`python3 -c "import os;print(int(round(os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES') / 1024.0**3)))"`


echo -e "
\n
++++++++++++++++++\n
+++++ UPTIME +++++\n
++++++++++++++++++\n
${UPTIME}\n\n
+++++++++++++++++\n
+++++ VCPU ++++++\n
+++++++++++++++++\n
Quantidade de vcpu: ${VCPU}\n\n
+++++++++++++++++++\n
  + ESPAÇO EM DISCO +\n
+++++++++++++++++++\n
${ESPACO}\n\n
++++++++++++++++++\n
+++++ MEMORIA ++++\n
++++++++++++++++++\n
Quantidade de memoria: ${MEM} Gb\n\n
O IP da sua máquina é: ${IP}\n"
