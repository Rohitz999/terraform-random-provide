resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "joy" {
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  engine            = "mysql"

  username = "someone"
  password = random_password.db_password.result

  skip_final_snapshot      = false
  final_snapshot_identifier = "joy-final-snapshot"
}