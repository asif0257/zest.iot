vpc_name    = "aisats-vpc"
region      = "asia-south1"
router_name = "aisats-router-nat"
nat_name    = "aisats-nat"

subnet_configs = [
  {
    name = "aisats-public"
    cidr = "10.0.4.0/24"
  },
  {
    name = "aisats-private-dev"
    cidr = "10.0.3.0/24"
  },
  {
    name = "aisats-private-qa"
    cidr = "10.0.2.0/24"
  },
  {
    name = "aisats-private-prod"
    cidr = "10.0.1.0/24"
  },
]

#instance_configs = [
 # {
  #  name         = "instance-1"
   # machine_type = "n1-standard-1"
    #zone         = "us-central1-a"
    #image        = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
    #subnet       = "private-subnet-1"
    # subnet       = module.subnet.subnets["private-subnet-1"]
  #},
  # Add 13 more instances as needed
#]

firewalls = [
  {
    name          = "allow-health-check"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["80,443"]
    source_ranges = ["130.211.0.0/22,35.191.0.0/16, 209.85.152.0/22, 209.85.204.0/22"]
  },
  {
    name          = "allow-iap-access"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["35.235.240.0/20"]
  },
  # Add more rules as needed
]
