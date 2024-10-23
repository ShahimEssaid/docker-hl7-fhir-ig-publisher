# docker-hl7-fhir-ig-publisher
A Docker image for the HL7 FHIR IG Publisher at https://github.com/HL7/fhir-ig-publisher

To run this for your IG for the first time you can use a command like the following assuming you're in the IG's directory where the ig.ini file is:

`docker run --pull=always --rm --volume .:/ig sessaid/ig-publisher:latest -ig ig.ini`

After the one time command above, you'll have a `bin-docker` directory that has up-to-date scripts for running this image in at least two different ways. 


https://hub.docker.com/repository/docker/sessaid/ig-publisher

https://github.com/FHIR/sample-ig
