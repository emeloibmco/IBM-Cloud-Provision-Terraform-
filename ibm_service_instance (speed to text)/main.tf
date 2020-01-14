data "ibm_space" "spacedata" {
  space = "<space_of_cloud_foundry>"   
  org   = "<org_of_cloud_foundry>"
}


resource "ibm_service_instance" "service_instance" {
  name       = "<instance_name>"
  space_guid = "${data.ibm_space.spacedata.id}"
  service    = "speech_to_text"
  plan       = "lite" #select lite of standard
  tags       = ["cluster-service", "cluster-bind"]
}