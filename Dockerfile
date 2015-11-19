FROM registry.access.redhat.com/openshift3/ose-haproxy-router:v3.0.2.0

ADD reload-haproxy /var/lib/haproxy/reload-haproxy

ENV container=docker \
    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin \
    TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template \
    RELOAD_SCRIPT=/var/lib/haproxy/reload-haproxy

WORKDIR /var/lib/haproxy/conf

RUN chmod -R 777 /var && \
    setcap 'cap_net_bind_service=ep' /usr/sbin/haproxy

EXPOSE 80

ENTRYPOINT ["/usr/bin/openshift-router"]
