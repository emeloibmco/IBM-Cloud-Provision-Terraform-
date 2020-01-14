data "ibm_is_ssh_key" "ds_key" {
  name = "<name_of-publick_key>"
}

resource "ibm_is_instance" "testacc_instance" {
  name    = "<name_of_vsi>"
  image   = "<image_id>"
  profile = "b-2x8"
  resource_group = "<resource_group_id>"


  primary_network_interface {
    subnet = "<subnet_id>"
  }

  vpc       = "<vpc_id>"
  zone      = "us-south-1"
  keys      = ["${data.ibm_is_ssh_key.ds_key.id}"]
}