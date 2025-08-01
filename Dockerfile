# jdk 버전
FROM openjdk:21-jdk-slim

# 빌드 파일 이미지 카피
COPY ./build/libs/demo-0.0.1-SNAPSHOT.war /app.war

# java 서버 실행 명령어
ENTRYPOINT ["java", "-jar", "app.war"]