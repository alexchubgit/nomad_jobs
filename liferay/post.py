import requests

files = {'file': open(
    '/home/user/Downloads/nomad_job/liferay/report.txt', 'rb')}

response = requests.post("http://192.168.56.62:8080/api/jsonws/dlapp/add-file-entry",
                          files=files, auth=('test@liferay.com', 'test'))

print(response.status_code)


print(response.text)
