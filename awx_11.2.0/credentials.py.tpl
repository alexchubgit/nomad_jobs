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

BROKER_URL = 'redis://{{ env "NOMAD_HOST_IP_redis" }}:6379' 

CHANNEL_LAYERS = {
    "default": {
    "BACKEND": "channels_redis.core.RedisChannelLayer", 
    "CONFIG": {"hosts": [BROKER_URL], "capacity": 10000, "group_expiry": 157784760}
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
