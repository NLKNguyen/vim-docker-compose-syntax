
" This is an automatically generated syntax file created on Fri, 30 Sep 2016 21:56:38 GMT
" Origin: https://github.com/NLKNguyen/docker-compose.vim
syn keyword DockerComposeSrc build
syn keyword DockerComposeSrc image
syn keyword DockerComposeCtx context
syn keyword DockerComposeCtx dockerfile
syn keyword DockerComposeCtx args
syn keyword DockerComposeRef cgroup_parent
syn keyword DockerComposeRef container_name
syn keyword DockerComposeRef depends_on
syn keyword DockerComposeRef extends
syn keyword DockerComposeCap cap_add
syn keyword DockerComposeCap cap_drop
syn keyword DockerComposeExt ports
syn keyword DockerComposeExt devices
syn keyword DockerComposeExt tmpfs
syn keyword DockerComposeExt expose
syn keyword DockerComposeNet networks
syn keyword DockerComposeNet dns
syn keyword DockerComposeNet dns_search
syn keyword DockerComposeNet extra_hosts
syn keyword DockerComposeNet external_links
syn keyword DockerComposeNet extra_hosts
syn keyword DockerComposeRun entrypoint
syn keyword DockerComposeRun command
syn keyword DockerComposeRun env_file
syn keyword DockerComposeEtc aliases
hi link DockerComposeSrc Repeat
hi link DockerComposeCtx Repeat
hi link DockerComposeRef Repeat
hi link DockerComposeCap Repeat
hi link DockerComposeExt Repeat
hi link DockerComposeNet Structure
hi link DockerComposeRun Statement
hi link DockerComposeEtc StorageClass
