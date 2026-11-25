resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.project_name}-bucket-2026"
  tags = {
    Name = "${var.project_name}-mybucket"
  }

}