resource "ibm_is_subnet" "testacc_subnet" {
  name            = "<vpc-name>"
  vpc             = "<id_of_the_existing_vpc>"
  zone            = "us-south-1"
  ipv4_cidr_block = "10.240.0.0/24"
}