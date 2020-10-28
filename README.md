# CTF Box

This is a Docker environment for CTF and vulnerability research based on ubuntu 20.04.

## Installation
### 0. Download CTF-Box

```bash
$ export CTF_BOX=~/.config/CTF-Box
$ git clone --depth=1 https://github.com/Palmcivet/CTF-Box.git $CTF_BOX
$ cd ./CTF-Box
```

`$CTF_BOX` is a folder, you can name it any way you want.

> **NOTICE**: Of course, you don't have to create `$CTF_BOX`， but we strongly recommend setting up a folder in which to store this project and your configurations. This makes it easier to start container with [alias](#alias "refer to").

### 1. Edit `.env`

Before launch, you should edit `.env` so that you can access your own files in the container.

```bash
$ vi .env
```

By default, the compose will pass `./` to those variables:

- `OUTER_FILE`: files that used like a tool, this directory is added into `$PATH`
- `OUTER_WORK`: your work directory, can be read and write frequently and temporarily

### 2. Build and run

```bash
$ docker-compose up -d
```

When execuate `docker-compose up`, the image will be built automatically. Please wait and take a rest.

### 3. Customize and hack fun

```bash
$ docker-compose exec ctf_box_app

╭─root@0ce6dc01b282 ~/work
╰─➤ ./HACK/custom.sh
```

> **NOTICE**: Using `docker-compose exec` rather than `docker exec`, so the `ctf_box_app` is the name of CTF-Box service.

The script `custom.sh` aimed at installing some binaries analysis tools, which need a good network connection.

## Instant container

You can launch an instant container:

```bash
$ docker run \
	-it \
	--rm \
	--name temp_app \
	-v /other_dir:/other:rw \
	ctf_img \
	/bin/zsh
```

Using `--rm` so it will be cleaned after exit.

> **NOTICE**: The arguments specified by `-v` should be absolute path.

## Environment

- `HACK`
    - `exec`: debuggers and executable files, copied during building
    - `tool`: installed by `custom.sh`
- `file`: mapped from `$OUTER_FILE`
- `work`: mapped from `$OUTER_WORK`

When you enter the CTF-Box, the pwd is `~/work` by default. This is actually your working directory.

## Alias

In order to launch the container quickly, you can add this to shell profile(such as `~/.bashrc`, `~/.zshrc`):

```bash
CTF_BOX=~/.config/CTF-Box

ctf_temp() {
    local CWD=$(cd $1; dirname $(pwd))
    if [ $# -eq 2 ]; then
        local VOL="-v $2"
    fi
    docker run \
        -it \
        --rm \
        --name temp_app \
        -e LANG=C.UTF-8 \
        -v $CWD:/root/work \
        $VOL \
        ctf_img \
        /bin/zsh
}
# eg: ctf_temp ./mywork ~/myapp:work
CTF_BOX_CMD="docker-compose -f $CTF_BOX/docker-compose.yml --env-file $CTF_BOX/.env"
alias ctf_enter="$CTF_BOX_CMD exec ctf_box_app /bin/zsh"
alias ctf_break="$CTF_BOX_CMD stop ctf_box_app"
alias ctf_start="$CTF_BOX_CMD start ctf_box_app && ctf_enter"
```

## Tools
### Essential

- python3-pip
- python3-dev
- ruby
- curl
- wget
- file
- git
- vim
- zsh
- oh-my-zsh
- proxychains4

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

### Ruby

- zsteg
- one_gadget
