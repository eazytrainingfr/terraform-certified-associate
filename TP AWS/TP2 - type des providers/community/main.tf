
provider "k8s" {
  config_context = "prod-cluster"
}

data "template_file" "nginx-deployment" {
  template = "${file("manifests/nginx-deployment.yaml")}"
}

resource "k8s_manifest" "nginx-deployment" {
  content = "${data.template_file.nginx-deployment.rendered}"
}

# creating a second resource in the nginx namespace
resource "k8s_manifest" "nginx-deployment" {
  content   = data.template_file.nginx-deployment.rendered
  namespace = "nginx"
}