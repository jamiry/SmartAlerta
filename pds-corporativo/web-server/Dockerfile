FROM tomcat:8-jre8

# tomcat-users.xml sets up user accounts for the Tomcat manager GUI
# and script access for Maven deployments
ADD tomcat/tomcat-users.xml $CATALINA_HOME/conf/

# add PostgreSQL JDBC driver jardoc	
ADD tomcat/postgresql-9.4.1209.jar $CATALINA_HOME/lib/
ADD ../smartalerta/dist/smartalerta.war $CATALINA_HOME/webapps/smartalerta/

CMD ["catalina.sh","run"]
