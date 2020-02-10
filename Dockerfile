FROM pegi3s/seqkit
LABEL maintainer="hlfernandez"

RUN apt-get update && apt-get install -y ncbi-blast+=2.6.0-1

ADD image-files/compi.tar.gz /

ADD pipeline.xml /pipeline.xml
ENTRYPOINT ["/compi", "run",  "-p", "/pipeline.xml"]
