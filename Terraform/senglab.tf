#example for the Dunwoody SENG Lab
#Big difference is that the SENG Lab doesn't have a cluster
#Notice it is commented out.
#Instead of specifying a Cluser, a specific vSphere Host is used:
#"vsphere_host"

variable "vmipaddress" {
  type = string
}

variable "vmhostname" {
  type = string
}

#password is commented out
provider "vsphere" {
  user           = "administrator@senglab.local"
  password       = "**********"
  vsphere_server = "10.43.200.203"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
data "vsphere_datacenter" "dc" {
  name = "SENGLABDC1"
}

data "vsphere_host" "hs" {
   name = "esxi01.senglab.net"
   datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = "SSD_DATASTORE_NAS"
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_compute_cluster" "cluster" {
 # name          = "SENGLABCLS1"
 # datacenter_id = data.vsphere_datacenter.dc.id
#}

data "vsphere_network" "network" {
  name          = "VM Network 40G"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "ub20template1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vmhostname
  resource_pool_id = data.vsphere_host.hs.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder = "Development"

  num_cpus = 1
  memory   = 1024
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vmhostname
        domain    = "senglab.net"
      }

      network_interface {
        ipv4_address = var.vmipaddress
        ipv4_netmask = 16
      }

      ipv4_gateway = "10.43.1.1"
      dns_suffix_list = ["senglab.net"]
      dns_server_list = ["10.43.200.250"]
    }
  }
}