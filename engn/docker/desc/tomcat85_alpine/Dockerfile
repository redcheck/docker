FROM tomcat:8.5.29-jre8-alpine

ENV PROJECT_CODE swam

ENV RUN_USER midadm
ENV RUN_GROUP midgrp
ENV PATH_ENGINE /engn
ENV PATH_SOURCE /sorc
ENV PATH_LOG /logs
ENV PATH_DATA /data

ENV APP_NAME tomcat
ENV PATH_APPLICATIONS ${PATH_SOURCE}/applications
ENV PATH_WEBDOCS ${PATH_SOURCE}/webdocs


RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir /usr/local/tomcat/webapps/ROOT

#RUN groupadd -g 3000 -r ${RUN_GROUP} && useradd -u 3001 -g ${RUN_GROUP} -d ${CATALINA_HOME} -s /bin/bash ${RUN_USER}
RUN addgroup -g 3000 -S ${RUN_GROUP} && adduser -u 3001 -S ${RUN_USER} -G ${RUN_GROUP} -h ${CATALINA_HOME} -s /bin/bash
RUN chown -R ${RUN_USER}:${RUN_GROUP} $CATALINA_HOME
#RUN ls -alh $CATALINA_HOME
#RUN su -c 'touch $CATALINA_HOME/include/test_pass' ${RUN_USER}
#RUN su -c 'touch $CATALINA_HOME/work/test_fail' ${RUN_USER}

user ${RUN_USER}
RUN mkdir -p ${CATALINA_HOME}/${PATH_ENGINE}/${APP_NAME}
RUN mkdir -p ${CATALINA_HOME}/${PATH_APPLICATIONS} && cd ${CATALINA_HOME}/${PATH_APPLICATIONS} && ln -s /usr/local/tomcat/webapps/ROOT ${PROJECT_CODE}
#RUN mkdir -p ${CATALINA_HOME}/${PATH_LOG}/${APP_NAME}
RUN mkdir -p ${CATALINA_HOME}/${PATH_LOG} && cd ${CATALINA_HOME}/${PATH_LOG} && ln -s /usr/local/tomcat/logs ${APP_NAME}
RUN mkdir -p ${CATALINA_HOME}/${PATH_DATA}/${PROJECT_CODE}

user root
#RUN pwd
#RUN ls -al
#RUN echo ~${RUN_USER}
#RUN ls -al ~${RUN_USER}
#RUN ls -al ~${RUN_USER}${PATH_ENGINE}
RUN mv ${CATALINA_HOME}${PATH_ENGINE} / 
RUN mv ${CATALINA_HOME}${PATH_SOURCE} / 
RUN mv ${CATALINA_HOME}${PATH_LOG} / 
RUN mv ${CATALINA_HOME}${PATH_DATA} / 

#EOS



