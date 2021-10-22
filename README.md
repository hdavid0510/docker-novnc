# docker-novnc

[![](https://img.shields.io/docker/pulls/hdavid0510/novnc?style=flat-square)](https://hub.docker.com/r/hdavid0510/novnc) [![](https://img.shields.io/docker/cloud/build/hdavid0510/novnc?style=flat-square)]() [![](https://img.shields.io/github/issues/hdavid0510/docker-novnc?style=flat-square)](https://github.com/hdavid0510/docker-novnc/issues)    
Standalone, lightweight noVNC client on alpine linux image.  
Docker script adapted from [here](https://github.com/ondh/dockerfiles/tree/master/novnc-proxy).


---
## Tags

### latest
[![](https://img.shields.io/docker/v/hdavid0510/novnc/latest?style=flat-square)]() [![](https://img.shields.io/docker/image-size/hdavid0510/novnc/latest?style=flat-square)]()  
Build from `master` branch.


---
## Environment Variables

### `SERVER`
* IP address and port of VNC server host.
* **DEFAULT** `localhost:5900`

### `KEY`
* Key file for TLS encryption
* **DEFAULT** `empty`

### `CRT`
* Cert file for TLS encryption
* **DEFAULT** `empty`
