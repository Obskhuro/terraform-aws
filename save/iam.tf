resource "aws_iam_user" "grousselle_iam_usr" {
    name = "grousselle_iam_usr"
}


resource "aws_iam_group" "grousselle_iam_grp" {
    name = "grousselle_iam_grp"
}

resource "aws_iam_group_policy_attachment" "group_access_ec2" {
  group      = aws_iam_group.grousselle_iam_grp.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_group_membership" "user_grousselle_in_grp_grousselle" {
  user   = aws_iam_user.grousselle_iam_usr.name
  groups = [aws_iam_group.grousselle_iam_grp.name]
}
