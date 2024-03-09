#!/bin/bash
sudo docker build -t bearing_fault_detect_v1 .
sudo docker rm -f bearing_fault_detect_v1
sudo docker run -d -it -p 5058:5058 --name bearing_fault_detect_v1 bearing_fault_detect_v1
