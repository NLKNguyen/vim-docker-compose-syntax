# vim-docker-compose-syntax
// WORK IN PROGRESS
// NOT READY FOR USE

docker build -t generator .
docker rum --rm -it -v $(pwd):/mnt generator

docker-compose build generator
docker-compose run --rm generator

