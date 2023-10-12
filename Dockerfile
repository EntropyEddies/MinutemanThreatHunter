# Use Debian as the base image
FROM debian:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Update package list and install networking tools
RUN apt update && \
    apt install -y iputils-ping curl net-tools

# Create a new user 'minuteman' and give it sudo privileges
RUN useradd -m minuteman && \
    apt install -y sudo && \
    usermod -aG sudo minuteman

# Set password for 'minuteman' (Optional)
# RUN echo 'minuteman:password' | chpasswd

# Create skel folders in 'minuteman' home directory
RUN bash -c "mkdir -p /home/minuteman/{Scripts,Scans,Wordlists,Logs}"

# Change ownership of skel folders to 'minuteman'
RUN chown -R minuteman:minuteman /home/minuteman/

# Set 'minuteman' as the default user
USER minuteman

# Set the default directory to /home/minuteman
WORKDIR /home/minuteman/