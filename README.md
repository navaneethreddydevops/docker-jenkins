# docker-jenkins
This Repo Holds Docker Based Jenkins files with plugins



Run This in existing Jenkins to collect installed plugins
```
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("${plugin.getShortName()}: ${plugin.getVersion()}")
}
```

```
docker run -d -p 8080:8080 -p 50000:50000 navaneethreddydevops/jenkins:1.0
```

```

docker-compose up -d && docker-compose logs -f

docker exec -it jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword
```