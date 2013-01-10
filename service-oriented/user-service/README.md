##user-service
### POST on user
    $ curl -X POST -d '{"name":"hermida2","email":"hermida@hermica.com","password":"7654","bio":"southern belle"}' http://localhost:3000/api/v1/users
### PUT on user
    $ curl -X PUT -d '{"bio":"skydiver"}' http://localhost:3000/api/v1/users/mateus
