# List of items to accomplish:

## General Configuration
- Add kali repo and kali keys
    - [Sources/repo](https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/)
    - [Keys](https://http.kali.org/kali/pool/main/k/kali-archive-keyring/)
        - [Key Fix Forum Link](https://superuser.com/questions/1644520/apt-get-update-issue-in-kali)
- Add my zsh_auto_configurator shit
    - Amend the file to remove icons from the terminal display

## Packages:
 - fing
   - https://www.fing.com/images/uploads/general/CLI_Linux_Debian_5.5.2.zip
 - nmap
 - p7zip-full
 - hping3 // maybe alias hping3 -T to traceroute
 - netcat-openbsd
 - iproute2 // adds the ip command cuz thats missing?

## Notes:
- MUST pass the network host to the container for access to network
> Container CAN access the host network, however layer 2 data is not received by the container, making enumerating that layer difficult
   - network however must be routed properly to the host's true network rather than a virtual subnetwork from the host
- Potentially may need to write a bash script to dynamically configure networking settings for target networks?



#### Miscellaneous Notes:
- fing command (or roughly) 
    - `fing -n {C.I.D.R/24} -r 5 --session /root/fing_session -o table,html,/root/fing.html -o log,csv,/root/log.csv`