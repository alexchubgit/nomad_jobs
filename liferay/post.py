import requests

# Fill in your details here to be posted to the login form.
payload = {
    'login': 'test@liferay.com',
    'password': 'password'
}

files = {'file': open(
    '/home/user/Downloads/nomad_job/liferay/report.txt', 'rb')}

response = requests.post("http://192.168.56.62:8080/api/jsonws/",
                          files=files, auth=payload)

print(response.status_code)


print(response.text)
