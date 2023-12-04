# Use Debian as the base image
## MUST PULL DOWN DEBIAN LOCALLY??
FROM debian:latest

# Set the maintainer label
LABEL maintainer="MinuteMon@EntryEddie.xyz"

## Switch shell to bash
SHELL ["/bin/bash", "-c"]

# Update package list and install networking tools
RUN apt update && \
    apt upgrade -y && \
    apt install -y iputils-ping curl iproute2 \
    wget curl p7zip-full netcat-openbsd \
    hping3 git neovim tmux

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

## Grab a few github repositories
USER minuteman

RUN cd /home/minuteman/Scripts && \
    git clone https://github.com/topazstix/auto-configurator.git && \
    git clone https://github.com/danielmiessler/SecLists.git ../Wordlists/SecLists && \
    git clone https://github.com/carlospolop/PEASS-ng.git && \
    git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git ../Wordlists/PayloadsAllTheThings && \
    git clone https://github.com/hacktoolspack/hack-tools.git

## Install cool zsh stuffs for ease of terminal operation
RUN cd /home/minuteman/Scripts/auto-configurator && \
    chmod +x ./zsh_super_confs.sh && \
    sudo ./zsh_super_confs.sh

## Introduce the Kali repositories to Debian
USER root
RUN wget "https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb" && \
    dpkg -i kali-archive-keyring_2022.1_all.deb && \
    rm kali-archive-keyring_2022.1_all.deb && \
    apt update

RUN echo $'## Introduce kali repos \n\
Types: deb \n\
# http://http.kali.org/kali \n\
# KEYS REQUIRED FOR INSTALL: \n\
# https://http.kali.org/kali/pool/main/k/kali-archive-keyring/ \n\
URIs: http://http.kali.org/kali \n\
Suites: kali-last-snapshot \n\
Components: main contrib non-free non-free-firmware \n\
Signed-By: /usr/share/keyrings/kali-archive-keyring.gpg' > /etc/apt/sources.list.d/kali.sources

## Snatch some kali tools
RUN apt install -y nmap

## Configure aliases for network enumeration stuffs
RUN echo "alias nmap='sudo nmap -vv'" >> /home/minuteman/.zshrc
RUN echo "alias pingsweep='sudo nmap -vv -sn --traceroute'" >> /home/minuteman/.zshrc
## Good zsh plugin for nmap tab completion
RUN sed -i 's/# nmap/nmap/g' /home/minuteman/.zshrc

## MUST BE LAST LINES
# Set 'minuteman' as the default user
USER minuteman

# Set the default directory to /home/minuteman
WORKDIR /home/minuteman/

CMD ["/usr/bin/zsh"]