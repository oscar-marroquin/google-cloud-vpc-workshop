##################################################################################
# Minimal Firewall rules to allow SSH and RDP from Google Identity Aware Proxy
##################################################################################


# Implicit deny rules
resource "google_compute_firewall" "implicit-deny-inbound-rule" {
    name = "${local.co_name}-${local.biz_name}-${local.env_name}-inbound-deny-rule"
    network = google_compute_network.vpc.name

    deny {
        protocol = "all"
    }

    priority = 65535

    source_ranges = ["0.0.0.0/0"]

    log_config {
      metadata  = "INCLUDE_ALL_METADATA"
    }
  
}

resource "google_compute_firewall" "implicit-deny-outbound-rule" {
    name = "${local.co_name}-${local.biz_name}-${local.env_name}-outbound-deny-rule"
    network = google_compute_network.vpc.name

    deny {
        protocol = "all"
    }

    direction = "EGRESS"

    priority = 65535

    destination_ranges = ["0.0.0.0/0"]

    log_config {
      metadata  = "INCLUDE_ALL_METADATA"
    }
  
}


#Allowing connections from Google IAP to manage Linux and Windows VM's
resource "google_compute_firewall" "allow-ssh-from-google-iap" {
    name = "${local.co_name}-${local.biz_name}-${local.env_name}-iap-internal-tcp-22-allow-rule"
    network = google_compute_network.vpc.name

    allow {
        protocol    = "tcp"
        ports       = ["22"]
    }

    source_ranges   = ["35.235.240.0/20"]

    target_tags     = ["linux-server"]

    log_config {
      metadata  =   "INCLUDE_ALL_METADATA"
    }

}

resource "google_compute_firewall" "allow-rdp-from-google-iap" {
    name = "${local.co_name}-${local.biz_name}-${local.env_name}-iap-internal-tcp-3389-allow-rule"
    network = google_compute_network.vpc.name

    allow {
        protocol    = "tcp"
        ports       = ["3389"]
    }

    source_ranges   = ["35.235.240.0/20"]

    target_tags     = ["windows-server"]

    log_config {
      metadata  =   "INCLUDE_ALL_METADATA"
    }

}