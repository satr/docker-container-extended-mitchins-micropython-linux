FROM mitchins/micropython-linux
COPY init.sh /root/init.sh
RUN /root/init.sh