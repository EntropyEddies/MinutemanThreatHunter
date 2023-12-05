# Example Reports

Reports can be generated through multiple tools within Minuteman Threat Hunter. The following reports are generated using Nmap and Fing.

## Nmap

Utilizing the aliased command `pingsweep` in our tool allows us to run a ping sweep utilizing nmap directly. Additionally, nmap itself is aliased to always produce `-vv` output.

- [Nmap Pingsweep](../reporting/scans/pingsweep.init)
- [Nmap TCP SYN, Service Version Detection, and OS Fingerprinting](../reporting/scans/nmap.init)

## Fing

Fing performs Layer 2 discovery and produces reports in any given format. The provided report is generated in HTML which can be downloaded and viewed in a browser. Additionally, a CSV log file is included.

The command utilized to generate these reports was:

- `fing -n {C.I.D.R/24} -r 5 --session /root/fing_session -o table,html,/root/fing.html -o log,csv,/root/log.csv`

The following reports were generated using Fing:

- [Fing HTML Report](../reporting/root/fing.html)
- [Fing CSV Log](../reporting/root/log.csv)
