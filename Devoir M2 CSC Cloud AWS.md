**IAM:**

* Créer un utilisateur iam-votre-nom
* Créer un groupe iam-votre-nom
* Intégrer l'utilisateur au groupe et assigner les autorisations EC2FullAccess au groupe créé

**EC2:**

Créer une instance EC2 avec Terraform 
* AMI: Ubuntu 
* Nom de l'instance : EC2-votre-nom
* Type d'instance t2.micro
* VPC et Subnet (choisir par défaut)
* Groupe de sécurité (Autoriser SSH et HTTP)

Se connecter à l'instance via SSH 
Installer Apache 2 
Accéder à la page depuis le navigateur en utilisant l'ip de l'instance

NB: Une capture pour chaque fonctionnalité Réussie


**S3:**

Créer un compartiment public avec Terraform

* Déposer un objet (fichier txt)
* Activer le versionning 
* Activer la fonctionnalité hébergement de site web statique
* Déposer un objet (page index.html personnaliser avec "Bonjour Master 2 informatique UCAD")
* Créer une régle de cycle de vie qui déplace les objets ayant plus de 90 jours de la classe S3 standard à la classe S3 Infrequent Access et qui supprime tous les objets au bout de 365 jours

NB: Une capture pour chaque fonctionnalité Réussie faite avec Terraform

Documentations:

https://iac.goffinet.org/infrastructure-as-code/terraform-ansible-provisioner/

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

