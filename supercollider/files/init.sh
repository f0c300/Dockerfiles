#/bin/bash
su -c "chown -R root:audio /dev/snd"
/usr/bin/jackd -r -dalsa -dhw:CODEC,0 -r48000 -p1024& 2>&1
echo "started jackd"
echo "now run scide& or scvim&"


