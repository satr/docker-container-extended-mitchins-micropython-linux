# Extended docker container of the image mitchins/micropython-linux
Original [container](https://hub.docker.com/r/mitchins/micropython-linux)

Installs in addition:
* net-tools (including `ifconfig`)
* ssh (and made it start when Bash starts)
* wget
* curl
* mc (Midnight Commander) - two panels file manager, containing also FTP client and much more
* code (Microsoft Visual Studio Code) - it allows to connect to the container with host's VSCode via SSH

* Adds a user "user1", with `sudo` permits. It needs to add a password to it:
`$ passwd user1`
* Runs `ifconfig` to display container's IP (to connect via SSH)

## How To
* Install [Docker](https://www.docker.com/products/docker-desktop)
* Get files
`git clone https://github.com/satr/docker-container-extended-mitchins-micropython-linux.git`
* Open the folder _docker-container-extended-mitchins-micropython-linux_ in the terminal
* Build the Docker image
`docker build .`
* Take the provided image-id and run an image with it
`docker run -it --name <IMAGE-NAME> --device=<PORT> bash`
** (Optional) `IMAGE-NAME` - name of the image
** (Optional) `PORT` - serial port of connected board - this port will be available within container. NB: in MacOS this does not work!
