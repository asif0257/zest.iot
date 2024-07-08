 terraform {
   backend "gcs" {
     bucket  = "zestiot-tfs"
     prefix  = "terraform/state"
   }
 }
