job "fabio" {  
  datacenters = ["dc1"]  
  type = "system"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "fabio" {  

    network {
      port "lb" {  
        static = 9999  
      } 
      port "ui" {
        static = 9998
      }
    }

    task "fabio" {  
      driver = "docker"  
      config {  
        image = "fabiolb/fabio"  
        network_mode = "host"  
        ports = ["lb","ui"]
      }
      resources {  
        cpu = 200  
        memory = 128  
      }  
    }  
  } 
} 
