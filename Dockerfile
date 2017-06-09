FROM kaixhin/vnc:latest
MAINTAINER Murphy McMahon <pandeiro.docker@gmail.com>

RUN apt-get update

#
# System tools
#
RUN apt-get install -y wget software-properties-common

#
# Install JDK
#
RUN apt-get install -y openjdk-7-jdk

#
# Install IDEA CE
#
# From tarball
WORKDIR /tmp
RUN wget -q 'https://download.jetbrains.com/idea/ideaIC-2017.1.4.tar.gz'
RUN tar xzf ideaIC-2017.1.4.tar.gz && rm ideaIC-2017.1.4.tar.gz
RUN mv idea-* /opt/idea
WORKDIR /opt/idea
RUN ln -s bin/idea.sh /usr/local/bin/idea.sh
WORKDIR /

# Add launcher
COPY intellij.desktop /usr/share/applications/intellij.desktop

# From PPA
#RUN add-apt-repository -y ppa:mmk2410/intellij-idea-community
#RUN apt-get update
#RUN apt-get install -y intellij-idea-community
