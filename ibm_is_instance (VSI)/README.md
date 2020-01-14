### Aprovisionamiento de una instancia de servidor virtual (VSI) en una VPC existente 📌

Cree el archivo _main.tf_ donde se agregará el contenido de la plantilla del recurso de speech to text. 

```
touch main.tf
```

Para crear la instancia es necesario importar la siguiente informacion de los recursos existentes con los que desea configurar su VSI:

**SSH key:** 
importe una SSH key que se encuentre cargada en IBM Cloud, para esto puede consultar las [keys guardadas en su cuenta de IBM Cloud](https://cloud.ibm.com/vpc/compute/sshKeys) o desde la CLI ejecutar el comando $ibmcloud is keys.

**image_id:**
Puede listar las imagenes disponibles desde la CLI de IBM Cloud ejecutando el siguiente comando $ibmcloud is images, seleccione la imagen que dese cargar a la instancia de servidor virtual y tome el Id de esta

**resource_group_id:**
Puede consultar los grupos de recursos en la [configuracion de su cuenta de ibm cloud](https://cloud.ibm.com/account/resource-groups) o desde la CLI ejecutando el comando ```$ibmcloud resource groups```

 
 📄
```
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
