FROM rocker/shiny-verse

# Clean up some cruft from the base image
RUN rm -rf /srv/shiny-server/sample-apps
RUN rm -rf /srv/shiny-server/[0-9][0-9]_*

# Change the index to redirect to the only running webapp.
RUN echo "<meta http-equiv='Refresh' content='0; url=\"./spirit_island\"' />" > /srv/shiny-server/index.html

# Install `renv` for below
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

# Switch to a directory unrelated to Shiny, for copying over files and installing packages.
WORKDIR /install

# Install the packages as part of the container, rather than at runtime.
COPY renv.lock renv.lock
ENV RENV_PATHS_LIBRARY renv/library
RUN R -e "renv::restore()"
