FROM registry.gitlab.com/jitesoft/dockerfiles/docker:latest
LABEL com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/clair-scanner" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/clair-scanner/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/clair-scanner" \
      com.jitesoft.app.clair-scanner.version="11" \
      com.jitesoft.app.clair-scanner.uri="https://github.com/arminc/clair-scanner" \
      com.jitesoft.app.clair-scanner.license="Apache-License-2.0"

COPY entrypoint /usr/local/bin

RUN apk add --no-cache curl ca-certificates \
 && curl -LsS https://github.com/arminc/clair-scanner/releases/download/v11/clair-scanner_linux_amd64 -o /usr/local/bin/clair-scanner \
 && chmod +x /usr/local/bin/clair-scanner /usr/local/bin/entrypoint \
 && apk del curl

ENTRYPOINT ["entrypoint"]
CMD ["-h"]
