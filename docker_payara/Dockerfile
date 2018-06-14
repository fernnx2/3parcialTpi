FROM payara/server-full
MAINTAINER fernando Alejandro jayson
ENV PATH $PATH:$PAYARA_PATH/bin
COPY ./wait-for-mariadb.sh ./
ADD mysql-connector-java-5.1.41-bin.jar $PAYARA_PATH/glassfish/domains/domain1/lib/ext/
RUN asadmin start-domain && asadmin create-jdbc-connection-pool --user admin --passwordfile /opt/pwdfile \
--datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.DataSource --steadypoolsize=2 --maxpoolsize=2 \
--property user=root:password=1234:DataBaseName=mantenimiento:ServerName=marmantenimiento:port=3306 mantenimiento && \
asadmin create-jdbc-resource --user admin --passwordfile /opt/pwdfile \
--connectionpoolid mantenimiento jndi/mantenimiento
ADD MantenimientoTpi-1.0-SNAPSHOT.war $AUTODEPLOY_DIR
EXPOSE 4848 8080
CMD ["asadmin", "start-domain", "-v"]
