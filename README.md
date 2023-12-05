# MinutemanThreatHunter

## ⚠️ DEVELOPERS START HERE

Read: [How To Contribute](./documentation/how-to-git.md)

## Table of Contents

- [MinutemanThreatHunter](#minutemanthreathunter)
  - [⚠️ DEVELOPERS START HERE](#️-developers-start-here)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Installation](#installation)
  - [Security Policy](#security-policy)
  - [Nmap Reference Guide](#nmap-reference-guide)

---

## Overview

Minuteman Threat Hunter is a tool meant to assist in mapping your internal network and identifying potential threats. It is meant to be used by network administrators and security analysts to identify potential threats and vulnerabilities in their network. It is not meant to be used as a replacement for a SIEM or other security tools, but rather as a supplement to them.

## Installation

- git clone this repo
- cd into the repo
- run `docker build -t debian-minuteman .`
  - if you want to rebuild from scratch:
  - `docker build --no-cache -t debian-minuteman .` 
- run `docker compose up -d`
- run `docker exec -it minuteman zsh`
  - or if above fails:
  - `docker compose run minuteman`

## Security Policy

Read the attached [security policy](./documentation/security-policy.md) for information on how to connect to the Minuteman Threat Hunter network remotely.

## Nmap Reference Guide

See the [Nmap Reference Guide](./documentation/nmap.md) for information on how to use Nmap.
