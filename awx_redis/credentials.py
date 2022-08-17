DATABASES = {
    'default': {
        'ATOMIC_REQUESTS': True,
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': "awx",
        'USER': "awx",
        'PASSWORD': "awxpass",
        'HOST': "192.168.56.62",
        'PORT': "5432",
    }
}

BROKER_URL = 'redis://192.168.56.62:6379'

CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("192.168.56.62", 6379)],
        },
    },
}

# CACHES = {
#     'default': {
#         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
#         'LOCATION': '{}:{}'.format("192.168.56.62", "11211")
#     },
#     'ephemeral': {
#         'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
#     },
# }


# BROKER_URL = 'amqp://{}:{}@{}:{}/{}'.format(
#     os.getenv("RABBITMQ_USER", None),
#     os.getenv("RABBITMQ_PASSWORD", None),
#     os.getenv("RABBITMQ_HOST", None),
#     os.getenv("RABBITMQ_PORT", "5672"),
#     os.getenv("RABBITMQ_VHOST", "tower"))

# CHANNEL_LAYERS = {
#     'default': {'BACKEND': 'asgi_amqp.AMQPChannelLayer',
#                 'ROUTING': 'awx.main.routing.channel_routing',
#                 'CONFIG': {'url': BROKER_URL}}
# }



CLUSTER_HOST_ID = "awx" # Change to hostname of the container & machine
SYSTEM_UUID = '00000000-0000-0000-0000-000000000000'


BROADCAST_WEBSOCKET_PROTOCOL = 'http' # http 
#BROADCAST_WEBSOCKET_PORT = 80 # http
BROADCAST_WEBSOCKET_SECRET='123456789'