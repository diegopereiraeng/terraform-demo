
resource "harness_cloudprovider_kubernetes" "harnesstf" {
  name = "${var.prefix}-kubernetes-sa"

  authentication {
    service_account {
      master_url = "https://10.10.10.10:443"
      service_account_token_secret_name = "${var.prefix}-github-token"
      ca_certificate_secret_name = "${var.prefix}-github-token"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}