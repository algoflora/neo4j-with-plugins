FROM neo4j:4.2.1

RUN sed -i '/dbms.default_listen_address/s/^/#/' /var/lib/neo4j/conf/neo4j.conf
RUN echo "dbms.security.procedures.unrestricted=apoc.*, algo.*, ga.*, spatial.*, ga.timetree.*" >> /var/lib/neo4j/conf/neo4j.conf
RUN echo "dbms.security.procedures.allowlist=apoc.*, algo.*, ga.*, spatial.*, ga.timetree.*" >> /var/lib/neo4j/conf/neo4j.conf

#RUN cat /var/lib/neo4j/conf/neo4j.conf
COPY ./*.jar /var/lib/neo4j/plugins/
COPY ./graphaware.conf /var/lib/neo4j/conf/graphaware.conf

RUN /var/lib/neo4j/bin/neo4j-admin set-initial-password testpassword

EXPOSE 7687

#RUN cat /var/lib/neo4j/conf/neo4j.conf