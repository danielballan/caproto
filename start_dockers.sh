export DOCKERIMAGE="klauer/epics-docker"
export PE_DOCKERIMAGE="klauer/simioc-docker"
export PE_DOCKERTAG="pyepics-docker"
docker pull ${DOCKERIMAGE}
docker pull ${PE_DOCKERIMAGE}:${PE_DOCKERTAG}
docker run -d -p $DOCKER0_IP:7000-9000:5064/tcp  ${DOCKERIMAGE}
docker run -d -p $DOCKER0_IP:7000-9000:5064/tcp ${PE_DOCKERIMAGE}:${PE_DOCKERTAG}
