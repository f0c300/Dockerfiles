## Supercollider with a lot of junk included !
# 
FROM debian:stretch

MAINTAINER f0c300 

RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get install --yes \
	alsa-base \
	alsa-utils \
	dbus-x11 \
	git \
	wget

RUN DEBIAN_FRONTEND=noninteractive  apt-get install --yes \
	jackd \
	supercollider \
	sc3-plugins \
	supercollider-vim \
	&& rm -rf /var/lib/apt/lists/*

# I get this annoying error way too often,
#" Error reading from server. Remote end closed"
#so I had to split the install in 2 parts

RUN echo "root:docker" | chpasswd

COPY files/asound.conf /etc/asound.conf
COPY files/init.sh /usr/local/bin/init.sh

RUN useradd --create-home --home-dir /home/super super \
	&& usermod -s /bin/bash super \
	&& gpasswd -a super audio \
	&& gpasswd -a super video \
	&& chown super:super /usr/local/bin/init.sh \
	&& chown -R super:super /home/super

USER super
WORKDIR /home/super

RUN vim-addons install supercollider
#TODO get some better vimrc

RUN wget https://raw.githubusercontent.com/f0c300/scfiles/master/samples.scd

CMD bash -C '/usr/local/bin/init.sh';'bash'

