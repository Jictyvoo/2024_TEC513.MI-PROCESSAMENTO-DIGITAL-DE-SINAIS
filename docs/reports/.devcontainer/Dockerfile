FROM ubuntu:22.04

# Set non-interactive frontend for apt and locales
ENV DEBIAN_FRONTEND=noninteractive
ENV LIBS_ESSENTIAL="pandoc make git procps locales curl"
ENV LIBS_BASIC_LATEX="texlive biber latexmk cpanminus"
ENV LIBS_LATEX="texlive-latex-base texlive-publishers texlive-science texlive-latex-extra texlive-extra-utils texlive-fonts-extra texlive-bibtex-extra texlive-lang-portuguese"
ENV LIBS_GRAPHICS="inkscape"

# Update and install essential libraries, LaTeX packages, and Inkscape
RUN apt update
RUN apt -y install --no-install-recommends $LIBS_ESSENTIAL
RUN apt -y install --no-install-recommends $LIBS_BASIC_LATEX
RUN apt -y install --no-install-recommends $LIBS_LATEX
RUN apt -y install --no-install-recommends $LIBS_GRAPHICS
RUN rm -rf /var/lib/apt/lists/*

# Configure locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR.UTF-8 LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8

# Install cpanm and missing latexindent dependencies
RUN cpanm Log::Dispatch::File YAML::Tiny File::HomeDir

# Verify Inkscape installation
RUN inkscape --version
