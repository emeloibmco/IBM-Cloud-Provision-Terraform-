### Aprovisionamiento de recursos de servicios de Virtual Private Cloud Classic 📌

Cree el archivo _main.tf_ donde se agregará el contenido de la plantilla del recurso de speech to text. 

```
touch main.tf
```

Para crear el recursos de nube privada virtual, debe obtener el ID del grupo de recusos que desea usar para crear el recurso, esto lo puede consultar en la [configuracion de su cuenta de ibm cloud](https://cloud.ibm.com/account/resource-groups) o desde la CLI ejecutando el comando ```$ibmcloud resource groups```
 
```
resource "ibm_is_vpc" "testacc_vpc" {
  name = "<name_vpc>"
  resource_group = "<resource_group_ID>"
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

