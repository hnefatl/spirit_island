FROM rocker/shiny-verse

RUN apt-get -y update && apt-get -y install \
    git
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

WORKDIR /install

# Install the packages as part of the container, rather than at runtime.
COPY renv.lock renv.lock
ENV RENV_PATHS_LIBRARY renv/library
RUN R -e "renv::restore()"
