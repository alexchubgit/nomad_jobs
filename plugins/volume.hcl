id        = "test-volume"
namespace = "default"
name      = "test-volume"
type      = "csi"
plugin_id = "hostpath-plugin"

capacity_min = "10GiB"
capacity_max = "20G"

capability {
  access_mode     = "multi-node-multi-writer"
  attachment_mode = "file-system"
}

mount_options {
  fs_type     = "ext4"
  mount_flags = ["noatime"]
}


# For 'nomad volume register', provide the external ID from the storage
# provider. This field should be omitted when creating a volume with
# 'nomad volume create'
#external_id = ""

