# Use Debian as the base image
## MUST PULL DOWN DEBIAN LOCALLY??
FROM debian:latest

# Set the maintainer label
LABEL maintainer="MinuteMon@EntryEddie.xyz"

# Update package list and install networking tools
RUN apt update && \
    apt install -y iputils-ping curl iproute2 \
    wget curl p7zip-full netcat-openbsd \
    hping3 

# Create a new user 'minuteman' and give it sudo privileges
RUN useradd -m minuteman && \
    apt install -y sudo && \
    usermod -aG sudo minuteman

## Configure user to run sudo without password
RUN echo 'minuteman ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create skel folders in 'minuteman' home directory
RUN bash -c "mkdir -p /home/minuteman/{Scripts,Scans,Wordlists,Logs}"

# Change ownership of skel folders to 'minuteman'
RUN chown -R minuteman:minuteman /home/minuteman/

## Snatch and install Fing
RUN cd /home/minuteman/Scripts && \
    mkdir fing && \
    cd fing && \
    wget 'https://www.fing.com/images/uploads/general/CLI_Linux_Debian_5.5.2.zip' -O fing.zip && \
    7z e fing.zip && \
    dpkg -i fing-5.5.2-amd64.deb && \
    cd ~




## MUST BE LAST LINES
# Set 'minuteman' as the default user
USER minuteman

# Set the default directory to /home/minuteman
WORKDIR /home/minuteman/