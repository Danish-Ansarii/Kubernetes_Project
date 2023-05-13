from ubuntu:22.04
label ="Danish Ansari"
run apt update && apt install httpd unzip zip -y
add https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/lib/html/
workdir /var/lib/html
run unzip photogenic.zip
run cp -rvf photogenic/* .
run rm -rf photogenic photogenic.zip
cmd ["usr/sbin/httpd","-D","FOREGROUND"]
expose 80 22 35


