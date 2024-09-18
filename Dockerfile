# Use an Ubuntu base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget curl net-tools xvfb x11vnc fluxbox && \
    apt-get clean

# Install KazmVNC or setup similar VNC server
RUN wget https://example.com/kazmvnc.tar.gz -O /tmp/kazmvnc.tar.gz && \
    tar -xzvf /tmp/kazmvnc.tar.gz -C /opt/kazmvnc

# Expose port for VNC
EXPOSE 5900

# Start VNC Server
CMD ["x11vnc", "-create", "-forever", "-shared"]
