FROM jenkinsci/blueocean

# As root...
USER root

# Update packages, remove guest user, add new group for docker and put jenkins in it
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories \
 && apk --no-cache add shadow \
 && userdel guest \
 && groupdel users \
 && groupdel ping \
 && groupmod -g 999 docker \
 && usermod -aG docker jenkins

# Switch back to jenkins user.
USER jenkins