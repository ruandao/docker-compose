FROM java8-withtime:v1
EXPOSE 8080
# 环境 dev|test|prod
ARG envType='prod'
ENV envType ${envType}
VOLUME /tmp
ADD ./target/xxx-boot.jar  /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=${envType}"]
