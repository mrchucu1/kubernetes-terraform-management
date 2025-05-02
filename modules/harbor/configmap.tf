variable "harbor_ca_cert" {
  type    = string
  default = <<-EOT
    -----BEGIN CERTIFICATE-----
    MIIDWDCCAkCgAwIBAgIQFr4KHyg7SxhAzG3BQpReRjANBgkqhkiG9w0BAQsFADAU
    MRIwEAYDVQQDEwloYXJib3ItY2EwHhcNMjUwNTAyMTU0NzQyWhcNMjYwNTAyMTU0
    NzQyWjArMSkwJwYDVQQDEyBoYXJib3IuYmxhdXRlY2guZGllZ29uYXZhcnJvLmRl
    djCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMnHu7A0RdSRisQFUcwX
    oA3TbqzhkifLQiYbye6DtSLr2Kdq1L1jhwt0tRarynGbfqnC9IuyixLeEtbIfc0m
    zyYm0g3hw6HNiOqghI/m6sMQR0sR+p24YkwOh0qphD1iNZEk6FGMpGwXePLIgpgk
    l5PDU0waaMVwfecDZeoJ9aB2ZCNZ8K+KzOkxwy9LbT5qSxrjhngfCcGlV2QgZe+r
    rOzigmJPL6s1SVhUWaVpPm9ZAF2tR0CPbFlzzEhQmkN/PyCqNDQaLHC2POnQ580Y
    rAah8UuOQVwwUm3Pwv+FjCknlshFdxT2Z7+DvgEnbTmkTZnNs2oX0FRM1DamKHTj
    Fn0CAwEAAaOBjjCBizAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUH
    AwEGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUIQav+LIoF79E
    yHpKovk1ukB9LEMwKwYDVR0RBCQwIoIgaGFyYm9yLmJsYXV0ZWNoLmRpZWdvbmF2
    YXJyby5kZXYwDQYJKoZIhvcNAQELBQADggEBAKp7KS+/H4etZdZtL4p0NpZ3lg9Q
    OTkV4T4lI+GRIFE/j2VaE/v640ottORk42UuezSixXoVVIAala3u4NdVXjkBfpCn
    AqnABRykrvJR7Nbl3zz00dneU65AWWR+/yal6R3XwfgnFG/TxNXo8W+oGrV9jJbj
    7lw8cn/XgcMofC/+Ci07VtzadA75IgEhJjdgI/o7tBnS9tHAVSfcP1h2fi/RVy1I
    Rhnkw+23oG88OeH4Z0ha+OuG5DjFhXvEHFV0O9NOwfAMIgOVWycemgOfjEFOwLaU
    Op89newcH/Fv1UZa/OZ2xJrOSMSljcDNOAIMSKlAg5G/DB6XSDP+WeKsUQk=
    -----END CERTIFICATE-----
  EOT
}

resource "kubernetes_config_map" "harbor_ca_cert" {
  metadata {
    name      = "harbor-ca-cert"
    namespace = var.namespace
  }

  data = {
    "ca.crt" = var.harbor_ca_cert
  }
}
