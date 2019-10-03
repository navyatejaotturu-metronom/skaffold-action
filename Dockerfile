FROM docker.pkg.github.com/anarcher/images/skaffold:v0.39.0

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
