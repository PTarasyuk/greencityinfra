data "aws_route53_zone" "example" {
  name = var.external_dns_zone
}

module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.20.0"

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  # External DNS
  enable_external_dns = true
  external_dns = {
    namespace = "kube-system"
    chart_version = var.helm_releases_version.external-dns
    values = [
      <<-EOT
        policy: upsert-only
        domainFilters: [ ${data.aws_route53_zone.example.name} ]
        tolerations:
        - key: CriticalAddonsOnly
          value: "true"
          operator: Equal
          effect: NoExecute
        - key: CriticalAddonsOnly
          value: "true"
          operator: Equal
          effect: NoSchedule
      EOT
    ]
    set = [
      {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/sts-regional-endpoints"
        value = "true"
        type  = "string"
      }
    ]
  }
  external_dns_route53_zone_arns = [
    data.aws_route53_zone.example.arn
  ]

  # AWS Load Balancer Controller
  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    namespace     = "kube-system"
    chart_version = var.helm_releases_version.aws_load_balancer_controller
    values = [
      <<-EOT
        tolerations:
        - key: CriticalAddonsOnly
          value: "true"
          operator: Equal
          effect: NoExecute
        - key: CriticalAddonsOnly
          value: "true"
          operator: Equal
          effect: NoSchedule
      EOT
    ]
    set = [
      {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/sts-regional-endpoints"
        value = "true"
        type  = "string"
      }
    ]
  }

  # ArgoCD
  enable_argocd = true
  argocd = {
    namespace = "argocd"
    chart_version = var.helm_releases_version.argocd
    values = [
      <<-EOT
        global:
          domain: argocd.greensity.space
        server:
          service:
            type: LoadBalancer
            annotations:
              service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
        configs:
          repository:
            name: greencityinfra
            type: git
            url: https://github.com/PTarasyuk/greencityinfra
        tolerations:
          - key: CriticalAddonsOnly
            value: "true"
            operator: Equal
            effect: NoExecute
          - key: CriticalAddonsOnly
            value: "true"
            operator: Equal
            effect: NoSchedule
      EOT
    ]
    set = [
      {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/sts-regional-endpoints"
        value = "true"
        type  = "string"
      }
    ]
  }
}
