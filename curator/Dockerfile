FROM alpine:3.6

ADD curator.yml /.curator/curator.yml
ADD curator-actions.yml /config/curator-actions.yml
ADD cron.sh /config/cron.sh
RUN chmod -x /config/cron.sh

# Install cron
RUN apk update && apk add --update busybox-suid

RUN apk --no-cache add python py-setuptools py-pip gcc libffi py-cffi python-dev libffi-dev py-openssl musl-dev linux-headers openssl-dev libssl1.0 && \
    pip install elasticsearch-curator==5.7.6 && \
    pip install boto3==1.9.143 && \
    pip install requests-aws4auth==0.9 && \
    pip install cryptography==2.6.1 && \
    apk del py-pip gcc python-dev libffi-dev musl-dev linux-headers openssl-dev && \
    sed -i '/import sys/a urllib3.contrib.pyopenssl.inject_into_urllib3()' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3.contrib.pyopenssl' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3' /usr/bin/curator

CMD ["sh", "/config/cron.sh"]