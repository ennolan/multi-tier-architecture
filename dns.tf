# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

# Create a new Route 53 hosted zone
resource "aws_route53_zone" "webapp_dns" {
  name = "example.com"  # Update with your domain name
}

# Create an A record for the load balancer
resource "aws_route53_record" "webapp_lb" {
  zone_id  = aws_route53_zone.webapp_dns.zone_id
  name     = "lb"  # Update with your subdomain
  type     = "A"
  ttl      = "300"
  records  = [aws_lb.alb_web.dns_name]  # Assuming the load balancer is provisioned separately
}

# Update this file with A record for additional load balancers if applicable
