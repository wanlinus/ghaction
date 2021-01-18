FROM openjdk:11 as builder
WORKDIR /data
ADD . .
RUN ./gradlew clean assemble

FROM openjdk:11-jre
MAINTAINER wanlinus wanlinus@qq.com
COPY --from=builder /data/build/libs/ghaction-0.0.1-SNAPSHOT.jar /data/app.jar

#该安全属性的目的是加快tomcat的启动速度。默认情况下，用于在Unix系统上的JVM中生成随机数的库依赖于/dev/random。
#在docker容器上，没有足够的熵来支持/dev/random。参见Not enough entropy to support /dev/random in docker containers running in boot2docker。
#随机数生成器用于 session ID生成。将其更改为/dev/urandom将使启动过程更快。
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/data/app.jar"]