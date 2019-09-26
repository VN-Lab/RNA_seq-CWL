FROM ubuntu:16.04
ADD  workflow_rnaseq.cwl /home/rvcebt/try_docker/ 
ADD  workflow_rnaseq.yml /home/rvcebt/try_docker/
CMD  sudo apt-get install cwltool
     sudo apt-get install cwlref-runner
CMD  cwl-runner workflow_rnaseq.cwl workflow_rnaseq.yml
     

  
  
  
     
  
