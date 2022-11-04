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

BROADCAST_WEBSOCKET_SECRET = "XzFwTFZnM0NSLUhWMHdybEVPaEQ="
