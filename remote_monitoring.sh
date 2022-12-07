#!/bin/bash

varreduraPortas () {
	FUNC=$1
	IP=$2
	C=$3
	shift; shift; shift;
	
	if [ $FUNC = "varreduraPortas" ]
	then 
		if [ $C = "-TCP" ]
		then 
			echo "------- Conexões TCP Ativas -------"
			snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.6.13.1.1
			echo "-----------------------------------"
			
		fi
		if [ $C = "-UDP" ]
		then 
			echo "------- Conexões UDP Ativas -------"
			snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.7.5.1.1
			echo "-----------------------------------"
		fi	
		if [ $IP ] && [ -z "$C" ]
		then
			echo "------- Conexões TCP Ativas -------"
			snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.6.13.1.1
			echo "-----------------------------------"

			echo "------- Conexões UDP Ativas -------"
			snmpwalk -v 2c -cpublic $IP 1.3.6.1.2.1.7.5.1.1
			echo "-----------------------------------"
		fi
		if [ -z "$IP" ] && [ -z "$C" ]
		then
			echo "------- Conexões TCP Ativas -------"
			snmpwalk -v 2c -cpublic localhost 1.3.6.1.2.1.6.13.1.1
			echo "-----------------------------------"

			echo "------- Conexões UDP Ativas -------"
			snmpwalk -v 2c -cpublic localhost 1.3.6.1.2.1.7.5.1.1
			echo "-----------------------------------"
		fi
	else
		echo "Função não existe."
	fi
}

### 
# Main
###

x=1
while [ $x = 1 ]
do
read func ip c

varreduraPortas $func $ip $c

done

###
# Testes
###

# varreduraPortas 127.0.0.1 -TCP
# varreduraPortas 127.0.0.1 -UDP
# varreduraPortas 127.0.0.1
# varreduraPortas


