#Create a GitHub Repository
resource "github_repository" "repo_since_terraform" {
  name        = "first_repo_since_terraform"
  description = "My awesome skills with terraform"

  visibility = "public"
}
