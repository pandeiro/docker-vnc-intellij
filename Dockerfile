FROM kaixhin/vnc:latest
MAINTAINER Murphy McMahon <pandeiro.docker@gmail.com>

#
# System tools
#
RUN apt-get update && \
    apt-get install -y wget software-properties-common openjdk-7-jdk && \
    rm -rf /var/lib/apt/lists/*

#
# Install IDEA CE
#
# From tarball
WORKDIR /tmp
RUN wget -q 'https://download.jetbrains.com/idea/ideaIC-2017.1.4.tar.gz' && \
    tar xzf ideaIC-2017.1.4.tar.gz && rm ideaIC-2017.1.4.tar.gz && \
    mv idea-* /opt/idea && \
    ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea.sh

WORKDIR /

# Add launcher
COPY intellij.desktop /usr/share/applications/intellij.desktop
