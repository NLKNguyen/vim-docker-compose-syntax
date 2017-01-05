# vim-docker-compose-syntax
docker build -t generator .
docker rum --rm -it -v $(pwd):/mnt generator

docker-compose build generator
docker-compose run --rm generator

