FROM alpine

RUN apk add --no-cache \
    bash \
    go \
    shadow \
    sudo

ENV GO111MODULE="on"

RUN userdel guest \
    && groupdel users \
    && addgroup gopls \
    && adduser -G gopls -h /home/gopls -D gopls \
    && echo '%gopls ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gopls

USER gopls

ENV GOBIN="/home/gopls/.bin"
ENV PATH="${GOBIN}:$PATH"

RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest \
    && go install github.com/ramya-rao-a/go-outline@latest \
    && go install github.com/cweill/gotests/gotests@latest \
    && go install github.com/fatih/gomodifytags@latest \
    && go install github.com/josharian/impl@latest \
    && go install github.com/haya14busa/goplay/cmd/goplay@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@latest \
    && go install golang.org/x/tools/gopls@latest

COPY --chown=gopls:gopls \
    docker_entrypoint.sh /home/gopls/docker_entrypoint.sh

CMD [ "/home/gopls/docker_entrypoint.sh" ]
