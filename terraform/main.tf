terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

# Control Plane

resource "libvirt_domain" "cp1" {
  name   = "c1-cp1"
  memory = 5120  
  vcpu   = 2

  network_interface {
    network_name = "default"
    addresses    = ["192.168.122.5"]
  }

  disk {
    file = "/var/lib/libvirt/images/c1-cp1.qcow2"
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}


# Nodes

resource "libvirt_domain" "node1" {
  name   = "c1-node1"
  memory = 3072  
  vcpu   = 2

  network_interface {
    network_name = "default"
    addresses    = ["192.168.122.10"]
  }

  disk {
    file = "/var/lib/libvirt/images/c1-node1.qcow2"
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}

resource "libvirt_domain" "node2" {
  name   = "c1-node2"
  memory = 3072
  vcpu   = 2

  network_interface {
    network_name = "default"
    addresses    = ["192.168.122.12"]
  }

  disk {
    file = "/var/lib/libvirt/images/c1-node2.qcow2"
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}

resource "libvirt_domain" "node3" {
  name   = "c1-node3"
  memory = 3072
  vcpu   = 2

  network_interface {
    network_name = "default"
    addresses    = ["192.168.122.13"]
  }

  disk {
    file = "/var/lib/libvirt/images/c1-node3.qcow2"
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}
