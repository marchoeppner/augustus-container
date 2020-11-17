FROM ubuntu/18.04
LABEL authors="Marc Hoeppner" \
      description="Docker image containing AUGUSTUS in comparative prediction mode"


    ENV AUGUSTUS_CONFIG_PATH /opt/augustus/3.3.3/config
    ENV PATH /opt/augustus/3.3.3/bin:/opt/augustus/3.3.3/scripts

    RUN apt-get -y update
    RUN apt-get -y install libboost-iostreams-dev zlib1g-dev libgsl-dev libboost-all-dev libsuitesparse-dev liblpsolve55-dev libsqlite3-dev libbamtools-dev libboost-all-dev wget make build-essential sqlite3 libsqlite3-dev

    RUN mkdir -p /opt/augustus && cd /opt/augustus 
    RUN wget https://github.com/Gaius-Augustus/Augustus/archive/v3.3.3.tar.gz && tar -xvf v3.3.3.tar.gz && rm v3.3.3.tar.gz
    RUN mv Augustus-3.3.3 3.3.3

    RUN cd 3.3.3

    RUN sed -ibak 's/^#COMP/COMP/' common.mk &&  sed -ibak 's/^#SQL/SQL/' common.mk  && make
   
