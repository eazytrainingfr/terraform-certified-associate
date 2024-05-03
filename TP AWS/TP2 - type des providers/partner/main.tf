# Configure the gridscale provider
provider "gridscale" {
  uuid = "gridscale_uuid"
  token = "gridscale_token"
}

# Create a server
resource "gridscale_server" "servername"{
  memory = ""
  name = ""
  cores = 2
}