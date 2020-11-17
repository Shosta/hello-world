# Pull Node 12 Image.
FROM node:15.1.0-alpine3.10

# Labels and Credits
LABEL \
    name="NodeJS Hello World as Dev Env" \
    author="Rémi Lavedrine <remi@github.com>" \
    maintainer="Rémi Lavedrine <remi@github.com>" \
    description="The Dockerfile that makes it available to develop a NodeJS HelloWorld app within a Container."

WORKDIR /root/home

EXPOSE 3000

RUN npm install

# Copy source files from host computer to the container
COPY . .

CMD ["node", "."]
