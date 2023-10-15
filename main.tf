provider "google" {
  project   = var.project_id
  region = var.region
}

resource "google_container_cluster" "gcp-cluster" {
  name = var.cluster_name
  location = var.region
  remove_default_node_pool = true 
  initial_node_count = 1
  network = var.vpc_name
  deletion_protection = false
}

resource "google_container_node_pool" "nodes" {
  name = "${google_container_cluster.gcp-cluster.name}-node-pool"
  location = var.region
  cluster = google_container_cluster.gcp-cluster.name
  node_count = var.node_count

  node_config {
    oauth_scopes = [ 
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
     ]

     labels = {
        env = var.project_id
     }

     machine_type = "n1-standard-1"
     tags = ["gke-node", "${var.project_id}-gke"]
     metadata = {
        disable_legacy-endpoints = "true"
     }
  }
}

