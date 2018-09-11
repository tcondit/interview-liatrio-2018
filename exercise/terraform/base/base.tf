resource "aws_instance" "base" {
    ami           = "ami-027a933122e083b25"
    instance_type = "t2.micro"
}
