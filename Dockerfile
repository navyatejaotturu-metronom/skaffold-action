FROM gcr.io/k8s-skaffold/skaffold:v1.8.0

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
