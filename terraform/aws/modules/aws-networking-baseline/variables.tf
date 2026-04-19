variable "allowed_cidrs" {
  description = "CIDRs permitidos para acesso administrativo"
  type        = list(string)
  default     = []
}
