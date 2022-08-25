DATABASES = {
    'default': {
        'ATOMIC_REQUESTS': True,
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': "{{ env "DATABASE_NAME" }}",
        'USER': "{{ env "DATABASE_USER" }}",
        'PASSWORD': "{{ env "DATABASE_PASSWORD" }}",
        'HOST': "{{ env "NOMAD_HOST_IP_postgres" }}",
        'PORT': "{{ env "NOMAD_PORT_postgres" }}",
    }
}

BROKER_URL = 'amqp://{}:{}@{}:{}/{}'.format(
    "{{ env "RABBITMQ_USER" }}",
    "{{ env "RABBITMQ_PASS" }}",
    "{{ env "NOMAD_HOST_IP_rabbit_ampq" }}",
    "{{ env "NOMAD_PORT_rabbit_ampq" }}",
    "{{ env "RABBITMQ_VHOST" }}")

CHANNEL_LAYERS = {
    'default': {'BACKEND': 'asgi_amqp.AMQPChannelLayer',
                'ROUTING': 'awx.main.routing.channel_routing',
                'CONFIG': {'url': BROKER_URL}}
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': '{}:{}'.format("{{ env "NOMAD_HOST_IP_memcached" }}", "{{ env "NOMAD_PORT_memcached" }}")
    },
    'ephemeral': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
    },
}
