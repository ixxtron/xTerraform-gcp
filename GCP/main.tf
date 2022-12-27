
// ## storage bucket for TF state files
// resource google_storage_bucket "xGCS1"{
//     name = "xbucket-tf-using-sa"
// }
// resource google_storage_bucket "xGCS1"{
//     name = "xtf-state-files"
// }

resource "google_storage_bucket" "bucketxfiles"{ 
  name = "ix-files"
  location = "US-CENTRAL1"
  labels = {
    env = "tf_env"
    dep = "compliance"
    iac = "required"
    infra = "essential"
    level = "basic"
  }
}
// resource "google_project_service" "project" {
//   project = var.project_id
//   service = "iam.googleapis.com"
// }


resource "google_compute_network" "xvpc_network" {
  name = "xvpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-xnet"
  network = google_compute_network.xvpc_network.name
  ip_cidr_range = "10.1.0.0/24"
  region = "us-central1"
}

resource "google_compute_firewall" "allows-icmp"{
  name = "allow-icmp"
  network = google_compute_network.xvpc_network.name
  allow{
    protocol = "icmp"
  }
  source_ranges = ["187.189.151.109/32"]
}

resource "google_compute_instance" "xvm" {
  name         = "xvm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["requirement", "essentials"]
  
  network_interface {
    network = google_compute_network.xvpc_network.name
    subnetwork = google_compute_subnetwork.sub-sg.id

    access_config {
      // Ephemeral IP
    }
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size = "10"
    }
  }

  metadata = {
    env = "tf_env"
    dep = "compliance"
    iac = "required"
    infra = "essential"
    level = "basic"
  }

  // service_account {
  //   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  // }
}

output "out-bucket" {
  value = [google_storage_bucket.bucketxfiles.id, google_storage_bucket.bucketxfiles.labels]
}

output "out-network" {
  value = [google_compute_network.xvpc_network.id, google_compute_network.xvpc_network.auto_create_subnetworks, 
  google_compute_network.xvpc_network.name]
}
