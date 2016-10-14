#! /bin/bash
docker exec -it $(docker ps | grep  puppies_web | ruby -ne 'puts $_.split.first') rails c

