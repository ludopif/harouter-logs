FROM registry.access.redhat.com/openshift3/ose-haproxy-router:v3.0.2.0

ADD reload-haproxy /var/lib/haproxy/reload-haproxy

EXPOSE 80
