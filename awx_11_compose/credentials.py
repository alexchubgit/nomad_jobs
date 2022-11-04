DATABASES = {
    'default': {
        'ATOMIC_REQUESTS': True,
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': "awx",
        'USER': "awx",
        'PASSWORD': "awxpass",
        'HOST': "postgres",
        'PORT': "5432",
    }
}

BROKER_URL = 'redis://redis:6379' 

CHANNEL_LAYERS = {
    "default": {
    "BACKEND": "channels_redis.core.RedisChannelLayer", 
    "CONFIG": {"hosts": [BROKER_URL], "capacity": 10000, "group_expiry": 157784760}
    } 
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': '{}:{}'.format("memcached", "11211")
    },
    'ephemeral': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
    },
}

BROADCAST_WEBSOCKET_SECRET = "ZnBzeXlaQ0ZVNmhjZi02b0FReVM="