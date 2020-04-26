# Extended docker container of the image mitchins/micropython-linux
Original [container](https://hub.docker.com/r/mitchins/micropython-linux)

Installs in addition:
* `net-tools` (including `ifconfig`)
* `ssh` (and made it starting when `Bash` starts)
* `wget`
* `curl`
* `mc` (Midnight Commander) - two panels file manager, containing also FTP client and much more
* `code` (Microsoft Visual Studio Code) - it allows to connect to the container with host's VSCode via SSH

* Adds a user `user1`, with `sudo` permits, in case SSH does not connect with `root` user without password. It needs to add a password to it: `passwd user1`. Alternatively - set password to the `root` user `passwd root`
* Runs `ifconfig` to display container's IP (to connect via SSH)

## How To
* Install [Docker](https://www.docker.com/products/docker-desktop)
* Build image
  1. Option: 
     * Get docker files
       ```
       git clone https://github.com/satr/docker-container-extended-mitchins-micropython-linux.git
       ```
     * Open the folder _docker-container-extended-mitchins-micropython-linux_ in the terminal
     * Build the Docker image (`-t` specified tag-name - put your own if needed)
       
       `docker build -t satr/micropython .`
  2. Option:
     * Build the Docker image from GItHub repository (`-t` specified tag-name - put your own if needed)
       
       `docker build -t satr/micropython https://github.com/satr/docker-container-extended-mitchins-micropython-linux.git`
  * Take the provided image-id and run an image with it
    ```
    docker run -it --name <IMAGE-NAME> --device=<PORT> <IMAGE-ID> bash
    ```
  * (Optional) `<IMAGE-NAME>` - name of the image
  * (Optional) `<PORT>` - serial port of connected board - this port will be available within container. NB: on MacOS this does not work (some articles describe workarounds)!
* Get a list of running containers

  `docker ps`
  * Or get a list of all containers, including those, which where exited from (check the coliumn `STATUS`)
    
    `docker ps -a`
* Start the container, if it is stopped
  ```
  docker start -a <CONTAINER-ID>
  ```
  * (Optional) `-a` (or `--attach`) - instanly attach to the container
  * `<CONTAINER-ID>` - container-id (or just container-id's few first characters) show with the command `docker ps -a`
* SSH to the started container
  
  `ssh user1@<CONTAINER-IP-ADDRESS>`
   * `<CONTAINER-IP-ADDRESS>` - IP address of the container, shown after its build, by `ifconfig` command, started within the container, or from the field "Networks"/"IPAddress", show by the command 
   
   `docker inspect <CONTAINER-ID>`
* Connect to the environment with VSCode via SSH
  * Start VSCode on the host machine
  * Install VSCode extensions
    * `Remote - SSH` by Microsoft
    * `Remote Development` by Microsoft
    * (Optional) `Remote - Containers` by Microsoft
    * (Optional) `Remote SSH: Editing Configuration` by Microsoft
    * (Optional) `Docker` by Microsoft
  * Click on the grin bar on the bottom left with `><` symbols, in the popup - type `user1@<CONTAINER-IP-ADDRESS>` and click "Remote-SSH: Connect to Host...", enter the `user1`'s password - new VSCode windo will be opened with container environment. NB: all extensions, added in this new window will be installe within the container.
