#!/bin/bash

varreduraPortas () {
	IP=$1
	C=$2
	shift; shift;
	
	#echo "IP= " $IP
	#echo "Tipo= " $C
	
	if [ $C = "-TCP" ]
	then 
		echo "------- Conexões TCP Ativas -------"
		snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.6.13.1.1
		echo "-----------------------------------"
		
	else
		echo "------- Conexões UDP Ativas -------"
		snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.7.5.1.1
		echo "-----------------------------------"
	fi		
}

### 
# Main
###

x=1
while [ $x = 1 ]
do
read ip c

varreduraPortas $ip $c

done

# varreduraPortas 127.0.0.1 -TCP
# varreduraPortas 127.0.0.1 -UDP
# varreduraPortas 127.0.0.1


