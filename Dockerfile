FROM niaquinto/gradle
MAINTAINER BRIDGE, JEROME <jeromebridge@pennassurancesoftware.com>

# In case someone loses the Dockerfile
# RUN rm -rf /etc/Dockerfile
# ADD Dockerfile /etc/Dockerfile

# Install Ping, Git
RUN apt-get update && \
    apt-get install -y iputils-ping git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# NOT USED RIGHT NOW
#########################################################################
# Add your desired user and group
# RUN groupadd yaas-group
# RUN useradd -s /bin/bash -m -d /app -g yaas-group yaas

# Set your desired user as default
# USER yaas
#########################################################################



# Script to run app
ADD run.sh ./run.sh
RUN chmod 755 /*.sh

# Set your default behavior
ENTRYPOINT ["/run.sh"]




# DELETE ME!!!!
#########################################################################
# CMD ["-Penv=docker", "setupVirgo", "runVirgo"]
# WORKDIR /app
# CMD -Penv=docker -Pyaas.db.host=$DB_PORT_5432_TCP_ADDR setupVirgo runVirgo
#########################################################################