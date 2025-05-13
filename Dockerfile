FROM jenkins/jenkins:lts

USER root

# Install required packages
RUN apt-get update && apt-get install -y wget tar

# Install Java 21 manually from Oracle
RUN cd /opt && \
    wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz && \
    tar -xvzf jdk-21_linux-x64_bin.tar.gz && \
    rm jdk-21_linux-x64_bin.tar.gz && \
    mv jdk-21* jdk-21

# Set Java 21 as default
RUN update-alternatives --install /usr/bin/java java /opt/jdk-21/bin/java 100 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk-21/bin/javac 100 && \
    update-alternatives --set java /opt/jdk-21/bin/java && \
    update-alternatives --set javac /opt/jdk-21/bin/javac

# Optional: Set JAVA_HOME
ENV JAVA_HOME=/opt/jdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

RUN java -version

USER jenkins