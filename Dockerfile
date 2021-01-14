FROM alpine:latest
LABEL maintiner="gdavid0510@gmail.com"

ENV SERVER "localhost:5900"
ENV GIT_NOVNC_REPO "https://github.com/novnc/noVNC"
ENV GIT_NOVNC_RELEASE "1.2.0"
ENV GIT_WEBSOCKETIFY_REPO "https://github.com/novnc/websockify"
ENV GIT_WEBSOCKETIFY_RELEASE "0.9.0"

WORKDIR /

COPY start.sh /start.sh

# Install package using --no-cache to update index and remove unwanted files
RUN apk add --no-cache python3 bash git procps

ADD ${GIT_NOVNC_REPO}/archive/v${GIT_NOVNC_RELEASE}.tar.gz /
ADD ${GIT_WEBSOCKETIFY_REPO}/archive/v${GIT_WEBSOCKETIFY_RELEASE}.tar.gz /
RUN	cd / \
	&& tar -xzf v${GIT_NOVNC_RELEASE}.tar.gz \
	&& mv noVNC-${GIT_NOVNC_RELEASE}/ /novnc \
	&& tar -xzf v${GIT_WEBSOCKETIFY_RELEASE}.tar.gz \
	&& mv websockify-${GIT_WEBSOCKETIFY_RELEASE}/ /novnc/utils/websockify \
	&& ln -s /novnc/vnc.html /novnc/index.html \
	&& chmod +x /start.sh \
	&& rm -rf /*.tar.gz

EXPOSE 6080

CMD ["/bin/sh","/start.sh"]