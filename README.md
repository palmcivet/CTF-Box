# CTF Box

This is a Docker environment for CTF based on ubuntu 20.04

## Usage

```bash
$ git clone --depth=1 https://github.com/Palmcivet/CTF-Box
$ cd ./CTF-Box
$ vi .env
$ docker-compose up -d
$ docker exec -it ctf_app /bin/zsh
$ ./HACK/custom.sh
```

You should edit `.env` so that you can use your file in the container. By default, the compose will pass `./` to those variables:

- `OUTER_FILE`: files that use as tool
- `OUTER_WORK`: your work directory

You can launch a instant docker with command:

```bash
$ docker run -it --rm --name temp_app -v /other_dir:/other:rw ctf_img /bin/zsh
```

Use `--rm` so it will be cleaned after exit.

> NOTICE: the arguments specified by `-v` should be absolute path.

## Environment

By default, you will enter `~`, with following directory:

- `HACK`
    - debug: debuggers that support remote debugging
    - toos: executable files
- `files`
- `work`

## Alias

In order to quick launch the docker, you can add this to shell profile(suck as `~/.bashrc`):

```bash
SEC_FILE="~/CTF-Box/docker-compose.yml"
ctf_temp() {
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
      ctf_img \
      /bin/zsh
}
alias ctf_enter="docker-compose -f $SEC_FILE exec ctf_app /bin/zsh"
alias ctf_break="docker-compose -f $SEC_FILE stop ctf_app"
alias ctf_start="docker-compose -f $SEC_FILE start ctf_app && ctf_enter"
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

### Misc

- yafu
- binwalk
- pcapfix
- foremost
- steghide
- pngcheck
- outguess
- imagemagick
- multimon-ng

### Binary

- gcc
- gdb
- ncat
- ltrace
- gdb-multiarch
- peda
- pwndbg
- radare2

### Python Lib

- gmpy2
- pwntools
- z3-solver(angr)
- ROPGadget(pwndbg)
- unicorn(pwndbg/gef)
- capstone(pwndbg/gef)
- keystone-engine(gef)
