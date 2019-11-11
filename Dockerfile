from jmeritt/debian-htpc

#Easy way to get sab dependencies prior to source installation
RUN sed -i 's#deb http://deb.debian.org/debian buster main#deb http://deb.debian.org/debian buster main contrib non-free#g' /etc/apt/sources.list && \
	sed -i 's#deb http://security.debian.org/debian-security buster/updates main#deb http://security.debian.org/debian-security buster/updates main contrib non-free#g' /etc/apt/sources.list && \
	sed -i 's#deb http://deb.debian.org/debian buster-updates main#deb http://deb.debian.org/debian buster-updates main contrib non-free#g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y sabnzbdplus git-all unrar python-pip unzip

   
RUN pip install sabyenc --upgrade

USER htpc

RUN cd ~ && \
	git clone https://github.com/sabnzbd/sabnzbd.git && \
	cd sabnzbd && \
	git checkout master

VOLUME /downloads
VOLUME /config

EXPOSE 8080

WORKDIR /home/htpc/sabnzbd
CMD ./SABnzbd.py --browser 0 -f /config/sabnzbd.ini


