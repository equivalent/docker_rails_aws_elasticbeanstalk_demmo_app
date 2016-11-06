#! /bin/bash
docker exec -it $(docker ps | grep nginx | ruby -ne 'puts $_.split.first') bash
