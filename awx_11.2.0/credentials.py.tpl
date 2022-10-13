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

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': '{}:{}'.format("{{ env "NOMAD_HOST_IP_memcached" }}", "{{ env "NOMAD_PORT_memcached" }}")
    },
    'ephemeral': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
    },
}

BROADCAST_WEBSOCKET_SECRET = "ZnBzeXlaQ0ZVNmhjZi02b0FReVM="