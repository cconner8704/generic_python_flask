FROM python:3
MAINTAINER Chris Conner chrism.conner@gmail.com

#Install requests, flask and supervisor
RUN pip install requests
RUN pip install paho-mqtt
RUN pip install flask
RUN apt-get update && apt-get install -y supervisor

#Make log dir for supervisor
RUN mkdir -p /var/log/supervisor

#Copy supervisor conf and app
COPY generic-python-flask-supervisord.conf /etc/supervisor/conf.d/generic-python-flask-supervisord.conf

# volumes
VOLUME /application

#Environment variables
ENV PORT 5000

#Expose ports
EXPOSE ${PORT}

CMD ["/usr/bin/supervisord"]
