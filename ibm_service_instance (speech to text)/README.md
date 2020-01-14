### Aprovisionamiento de una instancia Watson Studio (speech_to_text) 📌

Cree el archivo _main.tf_ donde se agregará el contenido de la plantilla del recurso de speech to text. 

```
touch main.tf
```

Para crear la instancia de servicio de speech to text, debe configurar el espacio y organización de su cuenta, esto lo puede verificar desde la [configuración de su cuenta en IBM Cloud](https://cloud.ibm.com/account/cloud-foundry) o desde la CLI ejecutando ```$ibmcloud target```
 
```
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
