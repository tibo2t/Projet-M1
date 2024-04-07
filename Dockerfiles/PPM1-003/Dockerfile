FROM debian:stable

RUN apt-get update && \
    apt-get install -y curl openssh-server ca-certificates tzdata perl

RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && \
    bash script.deb.sh && \
    apt-get install -y gitlab-ce

# Nettoyez le cache des paquets
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /script.deb.sh && \
    apt-get update 

# Exposez les ports GitLab
EXPOSE 80 443

# Démarrer GitLab lors du lancement du conteneur
ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && sleep 10 && gitlab-ctl reconfigure && tail -f /dev/null
