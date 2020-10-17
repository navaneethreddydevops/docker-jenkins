# docker-jenkins
This Repo Holds Docker Based Jenkins files with plugins



Run This in existing Jenkins to collect installed plugins
```
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("${plugin.getShortName()}: ${plugin.getVersion()}")
}
```