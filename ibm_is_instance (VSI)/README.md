### Aprovisionamiento de una subred en una VPC existente 📌

Cree el archivo _main.tf_ donde se agregará el contenido de la plantilla del recurso de speech to text. 

```
touch main.tf
```

Para crear una subred en una vpc existente, debe obtener el ID de la VPC donde desea crearla, para esto puede verficarlo desde la [pagina IBM Cloud](https://cloud.ibm.com/vpc/network/vpcs) o desde la linea de comandos ejecutando el comando $ibmcloud is vpcs
 
```
resource "ibm_is_subnet" "testacc_subnet" {
  name            = "<subnet-name>"
  vpc             = "<id_of_the_existing_vpc>"
  zone            = "us-south-1"
  ipv4_cidr_block = "10.240.0.0/24"
}
```

Ejecute los siguientes comandos para finalizar la creación de los recursos de ibm cloud.

* Genere el plan de ejecución de Terraform, aquí se valida la sintaxis de su archivo de configuración y las definiciones de recursos frente a las especificaciones que proporciona el plug-in IBM Cloud Provider, observe la salida del comando y verifique que la configuración del servicio este correcta.

```
Terraform plan
```

* Cree el recurso que ha descrito en la plantilla de terraform, confirme la ejecución cuando lo solicite con la palabra **yes.**

```
Terraform apply
```
