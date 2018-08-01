FROM jenkins/jenkins:2.121.1-alpine
#FROM jenkins/jenkins:2.107.2-alpine
#FROM jenkins:2.60.3-alpine

ENV RUN_USER midadm
ENV RUN_GROUP midgrp
ENV RUN_HOME /var/jenkins_home
ENV JENKINS_OPTS "${JENKINS_OPTS} --commonLibFolder=/var/jenkins_home/extlib"

USER root
#RUN groupadd -g 3000 -r ${RUN_GROUP} && useradd -u 3001 -g ${RUN_GROUP} -d ${RUN_HOME} -s /bin/bash ${RUN_USER}
RUN addgroup -g 3000 -S ${RUN_GROUP} && adduser -u 3001 -S ${RUN_USER} -G ${RUN_GROUP} -h ${RUN_HOME} -s /bin/bash
#RUN chown -R ${RUN_USER}:${RUN_GROUP} ${RUN_HOME}
RUN pwd;ls -alh 
#RUN ls -alh ${RUN_HOME}
#RUN su -c 'touch ${RUN_HOME}/include/test_pass' ${RUN_USER}
#RUN su -c 'touch ${RUN_HOME}/work/test_fail' ${RUN_USER}

user midadm
#EOS



