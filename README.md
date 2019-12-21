
# Tarea Dockers- [Tarea Dockers 2](#tarea-dockers)

  - [1.- Instalaciones previas](#1--instalaciones-previas)
  - [2.- Comandos](#2--comandos)

## 1.- Instalaciones previas

Antes de comenzar a utilizar dockers debemos tener instalado en nuestro computador varios elementos que pueden variar dependiendo de los requerimientos y además de las tecnologías que utilice el desarrollador. En nuestro caso se utilizaron las siguientes tecnologías:

- docker: Obviamente para poder utilizar nuestras imagenes en los contenedores sobre la maquina que creemos en dockers machine.
- docker-machine: Necesario para levantar la máquina que sostendrá tendrá todas las imágenes que hagamos correr sobre él.
- Virtualbox: Importante ya que es donde docker-machine alojará y administrará las máquinas que vayamos levantando en nuestro computador 

## 2.- Comandos

1. realizar un pull al servidor que utilizaremos.
> git pull https://github.com/faizhasim/unicorn-cat-service

2. Ingresamos al repositorio del código y realizamos los siguientes comandos.

> cd unicorn-cat-service/ 
> npm install
> npm start

Posteriormente revisamos el archivo **index.js**. Aquí el puerto por defecto es el puerto **3000**, podemos cambiarlo al puerto **80** para que quede por defecto este.

3. Creación del Dockerfile de la siguiente forma.

> touch Dockerfile
> nano Dockerfile

copiamos el siguiente código donde incluye **graphicmagick** necesario para correr la imagen de nuestro servicio.


``` YAML
FROM node:10
# Install graphics magick
RUN apt-get update && apt-get install -y graphicsmagick
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . .

## Puerto abierto
EXPOSE 80

CMD [ "node", "index.js" ]


```

4. Ahora creamos una imagen con dockers con el siguiente comando.

> docker build -t **usuario**/unicorn-cat-service .


5. Posteriormente  que contruimos la imagen levantamos nuestro maquina .

> docker-machine start

6. A continuación contruimos el contenedor que tendrá nuestra imagen.

>  docker run -p **puerto-app**:**puerto-salida** -d **usuario**/unicorn-cat-service

Como se señalo previamente el **puerto-app** corresponde el puerto que teniamos dispuesto en nuestra aplicación y el **puerto-salida** al que se mostrara en nuestra navegador.
