#/bin/bash
# Usage ./sshkey_copy.sh <publicip> <#nodes>
 
PIP=$1
COUNT=$2

if [ $# != 2 ]; then
    echo "Usage: $0 <publicip> <#nodes>"
    exit 1
fi

echo 'Host *' > /tmp/config
echo 'StrictHostKeyChecking no' >> /tmp/config
chmod 400 /tmp/config

for (( i=50000; i<50000+$COUNT; i++ )); do
  scp -o StrictHostKeyChecking=no -P $i ~/.ssh/id_rsa $PIP:.ssh/
  scp -o StrictHostKeyChecking=no -P $i /tmp/config $PIP:.ssh/
done

rm -f /tmp/config