# Spring Boot on Docker compose connecting to MySQL  and reverse proxying with nginx

1. To build the stack:
`docker-compose build`

2. In the Spring Boot Application, use the same container name of the mysql instance in the application.properties
`spring.datasource.url = jdbc:mysql://mysql-standalone:3306/test`
