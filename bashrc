function tr() {
	git add -u
}

function gb() {
	git branch | grep "*" | cut -d ' ' -f2
}

function gco() {
    local BRANCH=$(gb);
    local FUNCTION=$1;
    local COMMENT="${@:2}";
    git commit -m "$FUNCTION: $BRANCH: $COMMENT"
}


# Function to list AWS access keys for IAM users
function list_aws_access_keys() {
  # Hey, let's list all AWS access keys for IAM users.
  for i in $(aws iam list-users --query 'Users[*].UserName' --output text)
  do
    # Let's grab access keys for each IAM user and display them.
    aws iam list-access-keys --user-name $i --query 'AccessKeyMetadata[*].[U>'
  done
}

# Function to search for a text pattern in the Git repository
function git_grep() {
  # Alright, time to search for some text in our Git repository.
  local TEXT="${@:1}"
  # Let's perform a case-insensitive search for the provided text.
  git grep -i -n "$TEXT" -- "$(git rev-parse --show-toplevel)"
}

# Function to describe EC2 instances
function describe_instances() {
  # Let's describe an EC2 instance using its instance ID.
  local INSTANCE_ID=$1
  # Fetch detailed information about the specified EC2 instance.
  aws ec2 describe-instances --instance-id "$INSTANCE_ID" --query 'Reservations>'
}
