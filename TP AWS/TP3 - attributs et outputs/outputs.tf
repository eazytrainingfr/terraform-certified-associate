output "eip" {
  value = aws_eip.lb.public_ip
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}