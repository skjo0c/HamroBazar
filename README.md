This is a mentorship program by CloudFactory joined by me. This is mentorship program helped me to learn about 2 application architecture. Mentored by <a href="https://github.com/milap-neupane">Milap Neupane </a>, I was able to create this HamroBazar alike web application. This is repo contains the api and for the front-end, <a href= "https://github.com/skjo0c/hamrobazar-front"> this repo </a> is used.

Swagger has been added for the better understanding of how this api works so that it could be worked in other platforms as well and not just by me. A post method for advertisement is below:

```
paths:
  /advertisements:
    post:
      tags:
        - advertisement
      summary: Add a new Advertisement
      description: ''
      operationId: addAdvertisement
      consumes:
        - application/json
      produces:
        - application/json
      parameters:
        - in: body
          name: body
          description: Advertisment object that needs to be added
          required: true
          schema:
            $ref: '#/definitions/Advertisement'
      responses:
        '201':
          description: successful operation
          schema:
            $ref: '#/definitions/Advertisement'
        '405':
          description: Invalid input
      security:
        - api_key: []
```

Note that this project is for learning purpose and is still under development.