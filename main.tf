provider "google" {
  project = data.terraform_remote_state.gke.outputs.project_id
  region  = data.terraform_remote_state.gke.outputs.region
}


resource "google_compute_instance" "os1" {
  name         = "os1"
  machine_type = "e2-medium"
  zone         = "asia-south1-c"

 boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
}

network_interface {
    network = "default"
}

}
