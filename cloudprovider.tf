resource "harness_cloudprovider_kubernetes" "demo" {
  name = "${var.prefix}-kubernetes"

  authentication {
    delegate_selectors = ["k8s"]
  }

  usage_scope {
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "harness_cloudprovider_kubernetes_sa" "demo" {
  name = "${var.prefix}-kubernetes-sa"

  authentication {
    service_account {
      master_url = "https://10.10.10.10:443"
      service_account_token_secret_name = "${var.prefix}-github-token"
      ca_certificate_secret_name = "${var.prefix}-github-token"
    }
  }



  usage_scope {
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }

  lifecycle {
    create_before_destroy = true
  }
}