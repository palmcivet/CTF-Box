# Light Security

This is a Docker for CTF based on ubuntu:20.04

## Usage

```bash
$ git clone --depth=1 https://github.com/Palmcivet/light-security
$ cd ./light-security
$ vi .env
$ docker-compose up -d
$ docker exec -it sec_app /bin/zsh
```

You should edit `.env` so that you can use your file in the container. By default, the compose will pass `./` to those variables:

- `OUTER_FILE`: files that use as tool
- `OUTER_WORK`: your work directory

You can launch a instant docker with command:

```bash
$ docker run -it --rm --name temp_app -v /other_dir:/other:rw light_sec /bin/zsh
```

Use `--rm` so it will be cleaned after exit.

> NOTICE: the arguments specified by `-v` should be absolute path.

## Environment

By default, you will enter `~`, with following directory:

- SEC
    - debug: debuggers that support remote debugging
    - toos: executable files
- files
- work

## Alias

In order to quick launch the docker, you can add this to shell profile(suck as `~/.bashrc`):

```bash
SEC_FILE="~/light-security/docker-compose.yml"
sec_temp() {
    local CWD=$(cd $1; dirname $(pwd))
    if [ $# -eq 2 ]; then
      local VOL="-v $2"
    fi
    docker run \
      -it \
      --rm \
      --name temp_app \
      -v $CWD:/root/work \
      $VOL \
      light_sec \
      /bin/zsh
}
alias sec_enter="docker-compose -f $SEC_FILE exec sec_app /bin/zsh"
alias sec_break="docker-compose -f $SEC_FILE stop sec_app"
alias sec_start="docker-compose -f $SEC_FILE start sec_app && sec_enter"
```

## Tools
### Essential
- python3-pip
- python3-dev
- curl
- git
- vim
- zsh
- oh-my-zsh

### CTF
- binwalk
- pcapfix
- foremost
- steghide
- pngcheck
- outguess
- multimon-ng
- ncat
- ltrace
- gcc
- gdb
- gdb-multiarch
- peda
- radare2
- pwntools
- z3-solver
- gmpy
