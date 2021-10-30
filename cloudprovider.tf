
resource "harness_cloudprovider_kubernetes" "demo" {
  name = "${var.prefix}-kubernetes-sa"

  authentication {
    service_account {
      master_url = "https://10.10.10.10:443"
      service_account_token_secret_name = "gnp-cfdi-qa-serviceaccounttoken"
      ca_certificate_secret_name = "gnp-cfdi-qa-certificate"
    }
  }



  lifecycle {
    create_before_destroy = true
  }
}