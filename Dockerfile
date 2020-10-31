# Pull Node 12 Image.
FROM node:12

# Labels and Credits
LABEL \
    name="NodeJS Hello World as Dev Env" \
    author="Rémi Lavedrine <remi.lavedrine@outlook.com>" \
    maintainer="Rémi Lavedrine <remi.lavedrine@outlook.com>" \
    description="The Dockerfile that makes it available to develop a NodeJS HelloWorld app within a Container."

EXPOSE 3000

COPY . .

# Install adb tools, unzip, wget, signapk and apktool
RUN apt update -y && apt install -y --no-install-recommends \
    bash-completion \
    gcc \
    git

RUN apt install -y --no-install-recommends git zsh && chsh -s /usr/bin/zsh

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p sudo \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions

CMD ["node", "."]