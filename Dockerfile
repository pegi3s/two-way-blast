FROM pegi3s/seqkit
LABEL maintainer="hlfernandez"

# INSTALL COMPI
ADD image-files/compi.tar.gz /

# RUN apt-get update && apt-get install -y ncbi-blast+=2.6.0-1
RUN apt-get update && apt-get install -y wget && \
    cd /opt && \
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.6.0/ncbi-blast-2.6.0+-x64-linux.tar.gz && \
    tar -zxvf ncbi-blast-2.6.0+-x64-linux.tar.gz   && \
    rm ncbi-blast-2.6.0+-x64-linux.tar.gz  && \
    apt-get remove -y wget
    
ENV PATH="/opt/ncbi-blast-2.6.0+/bin:${PATH}"

# ADD PIPELINE
ADD pipeline.xml /pipeline.xml
ENTRYPOINT ["/compi", "run",  "-p", "/pipeline.xml"]
