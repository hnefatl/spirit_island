FROM rocker/shiny-verse

RUN apt-get -y update && apt-get -y install \
    git

WORKDIR /srv/shiny-server

#RUN git clone https://github.com/2cjenn/spirit_island .
#RUN Rscript install_packages.R
