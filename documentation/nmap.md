# Nmap Documentation

## Overview

Nmap is a versatile and widely used tool for network mapping and security auditing. It can discover hosts, services, and their attributes within a network.

## Basic Usage

To perform basic network enumeration and device discovery, execute the following commands:

### Ping Scan (Discovering Live Hosts)

- `nmap -sn <TARGET_IP>`

> This command performs a ping scan to identify hosts on the network without port scanning. Replace <TARGET_IP> with the target IP address, range, or CIDR notation.

### Host Discovery (TCP SYN Scan)

- `nmap -sS <TARGET_IP>`

> The TCP SYN scan will scan without completing the TCP handshake, making it less likely to be detected.

### Service Version Detection

- `nmap -sV <TARGET_IP>`

> This command will identify the version of services running on open ports.

### OS Fingerprinting

- `nmap -O <TARGET_IP>`

> Nmap can attempt to identify the operating system of the target host based on various characteristics, such as TCP/IP stack behaviors.

### Aggressive Scan (Intensive Scanning)

- `nmap -A <TARGET_IP>`

> The aggressive scan combines various scan types, including host discovery, port scanning, service version detection, and OS fingerprinting.

## Examples

### Discover live hosts in a range

- `nmap -sn 192.168.1.1-100`

### Enumerate a CIDR Network

- `nmap -sSCV 192.168.0.0/24`

### Perform a TCP SYN scan

- `nmap -sS 192.168.1.1`

### Identify service versions

- `nmap -sV 192.168.1.1`

### Conduct an OS fingerprinting

- `nmap -O 192.168.1.1`

### Aggressive scan

- `nmap -A 192.168.1.1`

## Conclusion

Nmap is a versatile tool that will be utilized by the Minuteman Threat Hunter to enumerate hosts to identify vulnerabilities.
