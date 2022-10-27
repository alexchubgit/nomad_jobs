import requests
import json

response = requests.get("http://192.168.56.62:8080/api/jsonws/user/get-user-by-id?userId=20139", auth=('test@liferay.com', 'password'))

print(response.status_code)

# print(response.json())

def jprint(obj):
    # create a formatted string of the Python JSON object
    text = json.dumps(obj, sort_keys=True, indent=4)
    print(text)


jprint(response.json())

