resource "aws_dynamodb_table" "table_efrei" {
  name           = "table-efrei"
  billing_mode   = "PAY_PER_REQUEST" # Mode à la demande [cite: 13]
  hash_key       = "chanteur"        # Clé de partition 
  range_key      = "chanson"         # Clé de tri 

  attribute {
    name = "chanteur"
    type = "S" # String [cite: 13]
  }

  attribute {
    name = "chanson"
    type = "S" # String [cite: 13]
  }

  # Défi 02 : PITR pour l'export S3 
  point_in_time_recovery {
    enabled = true
  }
}

# Exemple pour ajouter un élément (Défi 01) [cite: 16]
resource "aws_dynamodb_table_item" "item1" {
  table_name = aws_dynamodb_table.table_efrei.name
  hash_key   = aws_dynamodb_table.table_efrei.hash_key
  range_key  = aws_dynamodb_table.table_efrei.range_key

  item = <<ITEM
{
  "chanteur": {"S": "Youssou Ndour"},
  "chanson": {"S": "Wiri Wiri"}
}
ITEM
}