import requests

endpoint = 'http://localhost:3000/Users?select=id,email'
response = requests.get(endpoint)
response.text
# to json
r = response.json()
type(r)

r[0] if (type(r)==list and len(r)>1) else None
r[1] if (type(r)==list and len(r)>1) else None
