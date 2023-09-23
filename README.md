# spirit_island
Spirit Island score tracker and stat visualisation

## Record game results

![image](https://user-images.githubusercontent.com/17723393/224838456-ea3ad8c0-b048-42d4-8648-9f3b777e617d.png)

## Table of scores

![image](https://user-images.githubusercontent.com/17723393/224838480-b252d439-31bb-456c-979f-662e2295fbfa.png)

## Various plots

![image](https://user-images.githubusercontent.com/17723393/224838522-879dace2-5f89-4483-ab1a-fc17b30479c4.png)

![image](https://user-images.githubusercontent.com/17723393/224838585-2fc6d7cb-0afa-46a1-aa60-9c6fcd093c4f.png)

## Backup

Download your results to a csv file to browse and manipulate in any other way you want!

# Docker compose

1. First clone the application to a persistent location on the host (state is saved to this location):

   ```sh
   $ git clone https://github.com/2cjenn/spirit_island /mnt/user/shiny/mountponts/apps/spirit_island
   ```

1. Then run the `rocker/shiny-verse` webserver, hosting the application:

    ```dockerfile
    shiny:
        image: rocker/shiny-verse
        restart: unless-stopped
        # Build an image using the repo's docker file, to install dependencies all at once
        # at buildtime, rather than at runtime.
        build:
          - context: "/mnt/user/shiny/mountpoints/apps/spirit_island"
        volumes:
          - "/mnt/user/shiny/logs:/var/log/shiny-server"
          - "/mnt/user/shiny/mountpoints/apps/spirit_island:/srv/shiny-server/spirit_island"
    ```
