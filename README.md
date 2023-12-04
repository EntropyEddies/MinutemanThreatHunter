# MinutemanThreatHunter

## :warning: DEVELOPERS START HERE :warning:

### Read: [How To Contribute](./documentation/how-to-git.md)

---

:warning: [PRIVATE FOR NOW; WILL BE OPENED POSTHASTE] :warning:

## Overview

Minuteman Threat Hunter is a tool meant to assist in mapping your internal network and identifying potential threats. It is meant to be used by network administrators and security analysts to identify potential threats and vulnerabilities in their network. It is not meant to be used as a replacement for a SIEM or other security tools, but rather as a supplement to them.

## Installation

- git clone this repo
- cd into the repo
- run `docker build -t minuteman .`
  - if you want to rebuild from scratch:
  - `docker build --no-cache -t debian-minuteman .` 
- run `docker compose up -d`
- run `docker exec -it minuteman zsh`
  - or if above fails:
  - `docker compose run minuteman`

## Tools Included

- nmap
- traceroute
- fing (possibly)
- arpscan
- tcpdump
- tshark
- ?????
