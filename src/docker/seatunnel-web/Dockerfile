FROM hdhxby/seatunnel:2.3.4

ENV SEATUNNEL_WEB_VERSION="1.0.0"
ENV SEATUNNEL_WEB_HOME="/opt/seatunnel-web"

RUN wget https://dlcdn.apache.org/seatunnel/seatunnel-web/${SEATUNNEL_WEB_VERSION}/apache-seatunnel-web-${SEATUNNEL_WEB_VERSION}-bin.tar.gz
RUN tar -xzvf apache-seatunnel-web-${SEATUNNEL_WEB_VERSION}-bin.tar.gz
RUN mv apache-seatunnel-web-${SEATUNNEL_WEB_VERSION}-bin ${SEATUNNEL_WEB_HOME}
RUN wget https://seatunnel.apache.org/assets/files/download_datasource-4b79e6fafe80459590a6a0fc2865e5ac.sh
RUN mv download_datasource-4b79e6fafe80459590a6a0fc2865e5ac.sh ${SEATUNNEL_WEB_HOME}/bin/download_datasource.sh
# RUN cd ${SEATUNNEL_WEB_HOME} && sh bin/download_datasource.sh
RUN chmod 777 ${SEATUNNEL_WEB_HOME}/bin/seatunnel-backend-daemon.sh
CMD ${SEATUNNEL_WEB_HOME}/bin/seatunnel-backend-daemon.sh start
EXPOSE 8801