FROM library/debian:stretch-slim
LABEL maintainer="jgrau@xtec-cat"

RUN apt-get -y update && \
        apt-get -y install ffmpeg curl sed grep python && \
    	apt-get clean && \
    	rm -rf /var/lib/apt/lists/* && \
	ln -sf /dev/stdout /var/log/syslog && \
	curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /youtube-dl && \
	chmod +x /youtube-dl 

COPY temazo.sh /temazo.sh
#COPY youtube-dl /youtube-dl
ENTRYPOINT [ "/temazo.sh" ]
CMD [ "res-de-res" ]

