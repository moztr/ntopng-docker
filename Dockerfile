FROM armv7/armhf-ubuntu:16.04
MAINTAINER Mark Schmitt <moztr@zefiris.net>

RUN apt-get update
RUN apt-get -y -q install ntopng

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng "$@"' > /tmp/run.sh
RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]
