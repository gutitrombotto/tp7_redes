# tp7_redes
Trabajo Practico 7 - Docker

* docker-compose.yml es el script que crea y ejecuta la red con todos los hosts, servidores, router y switch del trabajo.
* Para su ejecucion se requiere instalar docker y tambien docker-compose.
* Luego se debe ejecutar el comando (sudo) docker-compose up -d (-d para no mostrar los mensajes del demonio de Docker).

#### Se crearán todos los containers experesado en el archivo docker-compose.yml. ####
* Para ingresar a los host se ejecuta el siguiente comando (sudo) docker attach <nombre_host>
* Para ingresar a quagga se ingresa con docker exec -it <nombre_quagga>bash (se ingresa al ubuntu).
* Si desea ingresar a zebra (router) hacerlo por telnet: telnet <ip_quagga> 2601. O a bgp: telnet <ip_quagga> 2606 
