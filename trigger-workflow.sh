EXECUTION_TIME=$(date '+%Y-%m-%d %H:%M:%S')
echo "Workflow execution started at: $EXECUTION_TIME"

gh workflow run "$GITHUB_WORKFLOW" \
  --repo "$GITHUB_REPOSITORY" \
  --ref "$GITHUB_BRANCH"
