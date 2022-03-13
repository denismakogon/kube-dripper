FROM alexmon1989/dripper:latest

WORKDIR /app
ADD entrypoint.sh .
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
