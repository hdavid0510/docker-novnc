FROM --platform=$TARGETPLATFORM alpine:latest
LABEL maintiner="gdavid0510@gmail.com"

ENV SERVER "localhost:5900"
ENV CRT ""
ENV KEY ""
WORKDIR /

COPY start.sh /start.sh

# Install package using --no-cache to update index and remove unwanted files
RUN apk add --no-cache python3 bash git procps\
	&& cd / \
	&& git clone https://github.com/novnc/noVNC /novnc \
	&& git clone https://github.com/novnc/websockify /novnc/utils/websockify \
	&& rm -rf /novnc/.git /novnc/utils/websockify/.git \
	&& ln -s /novnc/vnc.html /novnc/index.html \
	&& chmod +x /start.sh

EXPOSE 6080

ENTRYPOINT ["/bin/sh", "/start.sh"]
